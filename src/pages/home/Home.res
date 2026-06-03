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
  articlesConnection(orderBy: [{createdAt: DESC}]) {
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

module ArticleMeta = {
  let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]

  // Format an ISO timestamp (e.g. "2022-05-26T...") into "May 26, 2022".
  let publishedAt = iso => {
    let date = Js.Date.fromString(iso)
    let month =
      months->Array.get(Js.Date.getMonth(date)->Belt.Float.toInt)->Belt.Option.getWithDefault("")
    let day = Js.Date.getDate(date)->Belt.Float.toInt->Belt.Int.toString
    let year = Js.Date.getFullYear(date)->Belt.Float.toInt->Belt.Int.toString
    `${month} ${day}, ${year}`
  }

  // Estimate reading time in minutes from the article body (~200 words/min).
  let readingTime = body => {
    let words = body->Js.String2.split(" ")->Belt.Array.length
    Js.Math.max_int(1, words / 200)
  }
}

let getServerSideProps = context => {
  context->RelaySSR.executeQueryEnvironment(environment => {
    Query.fetchPromised(~environment, ~variables=(), ())
  })
}

let default = () => {
  let queryData = Query.use(~variables=(), ())
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
        {queryData.articlesConnection.edges->map(({node: article}, key) => {
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
      <Button label="Load more" />
    </Stack>
  </Box>
}
