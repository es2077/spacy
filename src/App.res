type pageProps

type props = {
  @as("Component")
  component: React.component<pageProps>,
  pageProps: pageProps,
}

let getDataFromPageProps = %raw(`function(pageProps) {
  return pageProps.relayData
}`)

let default = props => {
  let {component, pageProps} = props

  <RelaySSR.Provider data={getDataFromPageProps(pageProps)}>
    <Layout> {React.createElement(component, pageProps)} </Layout>
  </RelaySSR.Provider>
}
