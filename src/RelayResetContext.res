let context = React.createContext(() => ())
module Provider = {
  let provider = React.Context.provider(context)

  @react.component
  let make = (~value, ~children) => {
    React.createElement(provider, {value, children})
  }
}

let useResetRelayEnvironment = () => {
  React.useContext(context)
}
