type pageProps

type props = {
  @as("Component")
  component: React.component<pageProps>,
  pageProps: pageProps,
}

let default = props => {
  let {component, pageProps} = props

  {React.createElement(component, pageProps)}
}
