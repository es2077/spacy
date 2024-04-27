open RescriptRelay

let executeQueryEnvironment = (context: NextContext.t, transaction) => {
  let authToken = context.req.cookies->Js.Dict.get("spacy_auth")
  let environment = RelayEnv.make(~authToken?, ())

  transaction(environment)->Promise.thenResolve(res => {
    //Js.log(res)
    let sources = environment->Environment.getStore->Store.getSource->RecordSource.toJSON

    {
      "props": {
        "relayData": sources,
      },
    }
  })
}

module Provider = {
  @react.component
  let make = (~data, ~children) => {
    let environment = React.useMemo(() => RelayEnv.make(~records=data, ()))
    <RescriptRelay.Context.Provider environment> children </RescriptRelay.Context.Provider>
  }
}
