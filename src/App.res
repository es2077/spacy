type pageProps

type props = {
  @as("Component")
  component: React.component<pageProps>,
  pageProps: pageProps,
}

let default = props => {
  let {component, pageProps} = props

  <RescriptRelay.Context.Provider environment=RelayEnv.environment>
    <Layout> {React.createElement(component, pageProps)} </Layout>
  </RescriptRelay.Context.Provider>
}
