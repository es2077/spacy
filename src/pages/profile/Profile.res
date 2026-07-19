open AncestorSpacy
open Render

// The profile shows the current logged-in user. Hasura scopes usersConnection
// to the session user (select permission filters by X-Hasura-User-Email), so
// `first: 1` returns "me" — no username needed from the route.
module Query = %relay(`
query ProfileQuery {
  usersConnection(first: 1) {
    edges {
      node {
        id
        username
        bio
        avatarUrl
      }
    }
  }
}
`)

// Articles authored by a user. Users has no articles relationship, so this
// child component queries them by username (derived from the session user).
module ProfileArticles = {
  module Query = %relay(`
  query ProfileArticlesQuery($username: String!) {
    articlesConnection(
      where: {user: {username: {_eq: $username}}}
      orderBy: [{createdAt: DESC}]
    ) {
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

  @react.component
  let make = (~username) => {
    let data = Query.use(~variables={username: username}, ())

    <Stack gap=[xs(#one(8.0))] mt=[xs(14.0)] alignItems=[xs(#center)]>
      <Grid spacing=[xs(4.0)]>
        {data.articlesConnection.edges->map(({node: article}, key) => {
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
  }
}

let default = () => {
  let queryData = Query.use(~variables=(), ())

  switch queryData.usersConnection.edges->Belt.Array.get(0) {
  | None => <Box pt=[xs(14.0)]> {"Profile not found"->React.string} </Box>
  | Some({node: me}) =>
    <Box mt=[xs(14.0)] display=[xs(#flex)] justifyContent=[xs(#center)] width=[xs(100.0->#pct)]>
      <Box maxW=[xs(992->#px)] width=[xs(100.0->#pct)] position=[xs(#relative)]>
        <Stack
          direction=[xs(#horizontal)]
          alignItems=[xs(#center)]
          gap=[xs(#one(3.0))]
          right=[xs(#zero)]
          top=[xs(80->#px)]
          position=[xs(#absolute)]>
          <Button label="New article" />
          <Modal.Root>
            <Modal.Trigger asChild=true>
              <Typography color=[xs(#primary700)] href="#" tag=#a fontSize=[xs(1.6->#rem)]>
                {"Edit profile"->s}
              </Typography>
            </Modal.Trigger>
            <Modal.Overlay />
            <UpdateProfileModal />
          </Modal.Root>
        </Stack>
        <Stack alignItems=[xs(#center)]>
          <Avatar name={me.username} size=2.5 />
          <Typography
            m=[xs(0.0)]
            mt=[xs(3.0)]
            textAlign=[xs(#center)]
            fontSize=[xs(1.8->#rem)]
            color=[xs(#primary300)]
            fontWeight=[xs(#700)]
            letterSpacing=[xs(-0.02->#em)]
            tag=#span>
            {`@${me.username}`->s}
          </Typography>
          <Typography
            m=[xs(0.0)]
            mt=[xs(1.0)]
            textAlign=[xs(#center)]
            fontSize=[xs(2.8->#rem)]
            color=[xs(#primary700)]
            fontWeight=[xs(#700)]
            tag=#h1>
            {me.username->s}
          </Typography>
          <Typography
            tag=#p
            maxW=[xs(452->#px)]
            m=[xs(0.0)]
            mt=[xs(2.0)]
            textAlign=[xs(#center)]
            fontSize=[xs(1.8->#rem)]
            color=[xs(#primary300)]
            lineHeight=[xs(2.8->#rem)]
            fontWeight=[xs(#400)]>
            {me.bio->s}
          </Typography>
        </Stack>
        <ProfileArticles username={me.username} />
      </Box>
    </Box>
  }
}
