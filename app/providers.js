'use client';

import { createElement } from "react";
import { Context } from "rescript-relay/src/RescriptRelay.bs.js";
import { make as makeRelayEnvironment } from "../src/RelayEnv.bs";
import { AppWrapper } from "./app-wrapper";

// Create a singleton Relay environment that persists across renders
let clientEnvironment;

function getClientEnvironment(authToken) {
  if (typeof window === 'undefined') {
    // Server-side: create a new environment for each request with auth token
    return makeRelayEnvironment(undefined, authToken, undefined);
  }

  // Client-side: reuse the same environment
  if (!clientEnvironment) {
    clientEnvironment = makeRelayEnvironment();
  }

  return clientEnvironment;
}

export function Providers({ authToken, children }) {
  const environment = getClientEnvironment(authToken);

  return createElement(
    Context.Provider.make,
    { environment },
    createElement(AppWrapper, {}, children)
  );
}
