open AncestorSpacy

module Hero = Home_Hero

module HomeQuery = %relay(`
query HomeQuery {
  usersConnection(first: 1) {
    edges {
      node {
        id
        username
      }
    }
  }
  articlesConnection(first: 6, orderBy: [{createdAt: DESC}]) {
    edges {
      node {
        ...ArticleCardFragment_article
      }
    }
  }
}
`)

let default = () => {
  let queryData = HomeQuery.use(~variables=(), ())
  let (isSignUpModalOpen, setIsSignUpModalOpen) = React.useState(() => false)
  let setIsSignUpModalOpen = value => setIsSignUpModalOpen(_ => value)
  let closeSignUpModal = () => setIsSignUpModalOpen(false)

  <Box p=[xs(4.0)]>
    <Hero>
      <Hero.Title />
      <Box maxW=[xs(508->#px)] width=[xs(100.0->#pct)]>
        <Hero.Text />
      </Box>
      <Box maxW=[xs(178->#px)] width=[xs(100.0->#pct)]>
        {switch queryData.usersConnection.edges->Array.get(0) {
        | Some({node: me}) => <p> {React.string(`Hello ${me.username}`)} </p>
        | _ =>
          <Modal.Root _open=isSignUpModalOpen onOpenChange=setIsSignUpModalOpen>
            <Modal.Trigger asChild=true>
              <Button block=true label={`Create account`} />
            </Modal.Trigger>
            <Modal.Overlay />
            <SignUpModal closeSignUpModal />
          </Modal.Root>
        }}
      </Box>
    </Hero>
    <Stack gap=[xs(#one(8.0))] mt=[xs(14.0)] alignItems=[xs(#center)]>
      <Grid spacing=[xs(4.0)]>
        {queryData.articlesConnection.edges
        ->Array.mapWithIndex((edge, idx) => {
          <Box columns=[xs(#6)] key={idx->Belt.Int.toString}>
            <ArticleCard article={edge.node.fragmentRefs} />
          </Box>
        })
        ->React.array}
      </Grid>
      <Button label="Load more" />
    </Stack>
  </Box>
}
