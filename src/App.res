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

@react.component
let make = (~children) => {
  let queryData = Query.use(~variables=(), ())
  let user = queryData.usersConnection.edges[0]->Belt.Option.map(edge => edge.node.fragmentRefs)

  <Layout user={user}> {children} </Layout>
}
