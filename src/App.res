type pageProps

type props = {
  @as("Component")
  component: React.component<pageProps>,
  pageProps: pageProps,
}

let default = props => {
  let {component, pageProps} = props

  <div style={ReactDOM.Style.make(~border="solid 1px red", ())}>
    {React.createElement(component, pageProps)}
  </div>
}
