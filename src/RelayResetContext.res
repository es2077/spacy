// Context for resetting the Relay environment
let context = React.createContext(() => ())

module Provider = {
  let make = React.Context.provider(context)
}

let useResetRelayEnvironment = () => {
  React.useContext(context)
}
