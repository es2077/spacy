'use client';

import { createElement } from "react";
import { make as App } from "../src/App.bs";

// This wraps the App component which handles the AppQuery and passes user to Layout
export function AppWrapper({ children }) {
  return createElement(App, { children });
}
