open AncestorSpacy
open Render

module Hero = Home_Hero

module Query = %relay(`
query HomeQuery {
  usersConnection {
    edges {
      node {
        id
        username
      }
    }
  }
  ...HomeArticles_query
}
`)

module ArticlesFragment = %relay(`
fragment HomeArticles_query on query_root
@argumentDefinitions(
  count: {type: "Int", defaultValue: 6}
  cursor: {type: "String"}
)
@refetchable(queryName: "HomeArticlesPaginationQuery") {
  articlesConnection(first: $count, after: $cursor, orderBy: [{createdAt: DESC}])
  @connection(key: "HomeArticles_articlesConnection") {
    edges {
      node {
        id
        title
        intro
        slug
        body
        createdAt
        user {
          username
        }
      }
    }
  }
}
`)

let getServerSideProps = context => {
  context->RelaySSR.executeQueryEnvironment(environment => {
    Query.fetchPromised(~environment, ~variables=(), ())
  })
}

let default = () => {
  let queryData = Query.use(~variables=(), ())
  let articles = ArticlesFragment.usePagination(queryData.fragmentRefs)
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
        {articles.data.articlesConnection.edges->map(({node: article}, key) => {
          <Box columns=[xs(#6)] key>
            <Next.Link href={`/article/${article.slug}`}>
              <ArticleCard
                title={article.title}
                description={article.intro}
                authorName={article.user.username}
                readingTime={ArticleMeta.readingTime(article.body)}
                published={ArticleMeta.publishedAt(article.createdAt)}
              />
            </Next.Link>
          </Box>
        })}
      </Grid>
      {articles.hasNext
        ? <Button
            label={articles.isLoadingNext ? "Loading..." : "Load more"}
            disabled={articles.isLoadingNext}
            onClick={_ => articles.loadNext(~count=6, ())->ignore}
          />
        : React.null}
    </Stack>
  </Box>
}
