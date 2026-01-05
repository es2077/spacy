let isBrowser = %raw(`typeof window !== "undefined"`)

// Suspense binding
module Suspense = {
  @module("react") @react.component
  external make: (~children: React.element, ~fallback: React.element=?) => React.element = "Suspense"
}

// Singleton environment for client-side (persists across component remounts)
let clientEnvironment: ref<option<RescriptRelay.Environment.t>> = ref(None)

let getEnvironment = (~authToken: option<string>=?, ~records: option<'a>=?, ()) => {
  switch isBrowser {
  | false =>
    // Server-side: create new environment with auth token for SSR
    // If records are provided, use them for rehydration
    RelayEnv.make(~authToken?, ~records?, ())
  | true =>
    // Client-side: use singleton or create with pre-fetched records
    switch (clientEnvironment.contents, records) {
    | (Some(env), None) => env
    | (_, _) =>
      // Create new environment with optional records for rehydration
      let env = RelayEnv.make(~records?, ())
      clientEnvironment := Some(env)
      env
    }
  }
}

@react.component
let make = (~authToken: option<string>=?, ~relayData: option<'a>=?, ~children) => {
  let environment = React.useMemo2(
    () => getEnvironment(~authToken?, ~records=?relayData, ()),
    (authToken, relayData),
  )
  let (resetCounter, setResetCounter) = React.useState(() => 0)

  // Function to reset the Relay environment (for login/logout)
  let resetEnvironment = React.useCallback0(() => {
    switch isBrowser {
    | true =>
      // Clear the singleton and force re-render
      clientEnvironment := None
      setResetCounter(c => c + 1)
    | false => ()
    }
  })

  // Re-get environment after reset
  let currentEnvironment = if resetCounter > 0 {
    getEnvironment(~authToken?, ())
  } else {
    environment
  }

  <RelayResetContext.Provider value={resetEnvironment}>
    <RescriptRelay.Context.Provider environment={currentEnvironment}>
      <Suspense fallback={React.null}>
        <App> children </App>
      </Suspense>
    </RescriptRelay.Context.Provider>
  </RelayResetContext.Provider>
}
