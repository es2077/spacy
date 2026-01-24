'use client';

import { createElement, useCallback, useState } from "react";
import { Context } from "rescript-relay/src/RescriptRelay.bs.js";
import { make as makeRelayEnvironment } from "../src/RelayEnv.bs";
import { Provider as RelayResetProvider } from "../src/RelayResetContext.bs";
import { AppWrapper } from "./app-wrapper";

// Singleton environment for client-side (persists across component remounts)
let clientEnvironment = null;

function getEnvironment(authToken) {
  if (typeof window === 'undefined') {
    // Server-side: create new environment with auth token for SSR
    return makeRelayEnvironment(undefined, authToken, undefined);
  }

  // Client-side: use singleton (don't pass authToken, cookies sent automatically)
  if (!clientEnvironment) {
    clientEnvironment = makeRelayEnvironment(undefined, undefined, undefined);
  }
  return clientEnvironment;
}

export function Providers({ authToken, children }) {
  const environment = getEnvironment(authToken);
  const [resetCounter, setResetCounter] = useState(0);

  // Function to reset the Relay environment (for login/logout)
  const resetEnvironment = useCallback(() => {
    if (typeof window !== 'undefined') {
      // Clear the singleton and force re-render
      clientEnvironment = null;
      setResetCounter(c => c + 1);
    }
  }, []);

  // Re-get environment after reset
  const currentEnvironment = resetCounter > 0 ? getEnvironment(authToken) : environment;

  return createElement(
    RelayResetProvider.make,
    { value: resetEnvironment },
    createElement(
      Context.Provider.make,
      { environment: currentEnvironment },
      createElement(AppWrapper, {}, children)
    )
  );
}
