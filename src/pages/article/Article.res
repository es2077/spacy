open AncestorSpacy

module Query = %relay(`
query ArticleQuery($slug: String!) {
  articlesConnection(where: {slug: {_eq: $slug}}, first: 1) {
    edges {
      node {
        id
        title
        intro
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

module Styles = {
  let container = Emotion.css({
    "h2": {
      "margin": 0,
      "marginBottom": Theme.spacing(3.0),
      "color": Theme.colors(#primary700),
      "fontSize": "3.2rem",
      "lineHeight": "3.2rem",
      "fontWeight": 700,
    },
    "h3": {
      "margin": 0,
      "marginBottom": Theme.spacing(1.5),
      "color": Theme.colors(#primary700),
      "fontSize": "2.4rem",
      "lineHeight": "2.8rem",
      "fontWeight": 700,
    },
    "a": {
      "color": Theme.colors(#primary700),
      "fontWeight": 500,
      "textDecoration": "underline",
      "fontSize": "1em",
    },
    "p": {
      "margin": 0,
      "marginBottom": Theme.spacing(2.0),
      "fontSize": "1.8rem",
      "lineHeight": "2.8rem",
      "color": Theme.colors(#primary300),
    },
  })
}

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
    Js.Math.max_int(1, words / 200)->Belt.Int.toString ++ "min"
  }
}

let default = () => {
  let router = Next.Router.useRouter()
  let slug = router.query->Js.Dict.get("slug")->Belt.Option.getWithDefault("")
  let queryData = Query.use(~variables={slug: slug}, ())

  switch queryData.articlesConnection.edges->Belt.Array.get(0) {
  | None => <Box pt=[xs(14.0)]> {"Article not found"->React.string} </Box>
  | Some({node: article}) =>
    <Stack pt=[xs(14.0)] maxW=[xs(784->#px)] width=[xs(100.0->#pct)] gap=[xs(#one(2.0))]>
      <Stack
        direction=[xs(#horizontal)]
        alignItems=[xs(#center)]
        gap=[xs(#one(1.5))]
        divider={<Base tag=#span fontSize=[xs(2.0->#rem)] color=[xs(#primary200)]>
          {"//"->React.string}
        </Base>}>
        <ProfileName name={article.user.username} />
        <Typography tag=#span fontSize=[xs(16->#px)] fontWeight=[xs(#700)] color=[xs(#primary700)]>
          {ArticleMeta.readingTime(article.body)->React.string}
        </Typography>
        <Typography tag=#span fontSize=[xs(16->#px)] fontWeight=[xs(#700)] color=[xs(#primary700)]>
          {ArticleMeta.publishedAt(article.createdAt)->React.string}
        </Typography>
      </Stack>
      <Stack gap=[xs(#one(2.0))] mb=[xs(6.0)]>
        <Typography
          m=[xs(0.0)]
          tag=#h1
          fontSize=[xs(3.6->#rem)]
          letterSpacing=[xs(-0.04->#em)]
          lineHeight=[xs(4.6->#rem)]
          color=[xs(#primary700)]>
          {article.title->React.string}
        </Typography>
        <Typography
          m=[xs(0.0)]
          tag=#p
          color=[xs(#primary300)]
          fontSize=[xs(1.8->#rem)]
          lineHeight=[xs(2.8->#rem)]>
          {article.intro->React.string}
        </Typography>
      </Stack>
      <Box className=Styles.container dangerouslySetInnerHTML={{"__html": article.body}} />
    </Stack>
  }
}
