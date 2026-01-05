open AncestorSpacy

module ArticleQuery = %relay(`
query ArticleQuery($slug: String!) {
  articlesConnection(where: {slug: {_eq: $slug}}, first: 1) {
    edges {
      node {
        id
        title
        intro
        body
        createdAt
        authorId
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

type router = {query: Js.Dict.t<string>}

@module("next/router")
external useRouter: unit => router = "useRouter"

let default = () => {
  let router = useRouter()
  let slug = router.query->Js.Dict.get("slug")->Belt.Option.getWithDefault("")

  let queryData = ArticleQuery.use(~variables={slug: slug}, ())

  switch queryData.articlesConnection.edges->Array.get(0) {
  | Some({node: article}) =>
    <Stack pt=[xs(14.0)] maxW=[xs(784->#px)] width=[xs(100.0->#pct)] gap=[xs(#one(2.0))]>
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
  | None =>
    <Stack pt=[xs(14.0)] maxW=[xs(784->#px)] width=[xs(100.0->#pct)]>
      <Typography fontSize=[xs(2.0->#rem)] color=[xs(#primary700)]>
        {"Article not found"->React.string}
      </Typography>
    </Stack>
  }
}
