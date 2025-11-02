type pageProps

type props = {
  @as("Component")
  component: React.component<pageProps>,
  pageProps: pageProps,
}

let getDataFromPageProps = %raw(`function(pageProps) {
  return pageProps.relayData;
}`)

module Query = %relay(`
query AppQuery {
  usersConnection(first: 1) @connection(key: "AppQuery_usersConnection") {
    edges {
      node {
        ...HeaderFragment_user
      }
    }
  }
}
`)

module App = {
  @react.component
  let make = (~children) => {
    let queryData = Query.use(~variables=(), ())
    let user = queryData.usersConnection.edges[0]->Belt.Option.map(edge => edge.node.fragmentRefs)

    <Layout user={user}> {children} </Layout>
  }
}

let getInitialProps = context => {
  context->RelaySSR.executeQueryEnvironment(environment => {
    Query.fetchPromised(~environment, ~variables=(), ())
  })
}

let default = props => {
  let {component, pageProps} = props

  <RelaySSR.Provider data={getDataFromPageProps(pageProps)}>
    <App> {React.createElement(component, pageProps)} </App>
  </RelaySSR.Provider>
}
