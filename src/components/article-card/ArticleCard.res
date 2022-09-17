open AncestorSpacy

module Styles = {
  let card = Emotion.css({
    "background": Theme.colors(#primary200)->Polished.transparentize(0.7, _),
    "padding": Theme.spacing(4.0),
    "borderRadius": 2,
    "transition": "250ms background-color",
    "&:hover": {
      "background": Theme.colors(#primary200)->Polished.transparentize(0.5, _),
    },
  })
}

module Metadata = {
  @react.component
  let make = (~children) => {
    <Typography fontSize=[xs(14->#px)] fontWeight=[xs(#700)] color=[xs(#primary700)]>
      {children->React.string}
    </Typography>
  }
}

@react.component
let make = (~title, ~description, ~authorName, ~published, ~readingTime) => {
  <Stack className=Styles.card gap=[xs(#one(3.0))]>
    <Stack gap=[xs(#one(1.0))]>
      <Typography
        m=[xs(0.0)]
        fontSize=[xs(22->#px)]
        fontWeight=[xs(#700)]
        letterSpacing=[xs(-0.04->#em)]
        color=[xs(#primary700)]
        tag=#p>
        {title->React.string}
      </Typography>
      <Typography
        m=[xs(0.0)] fontSize=[xs(16->#px)] fontWeight=[xs(#400)] color=[xs(#primary300)] tag=#p>
        {description->React.string}
      </Typography>
    </Stack>
    <Stack
      direction=[xs(#horizontal)] justifyContent=[xs(#"space-between")] alignItems=[xs(#center)]>
      <ProfileName name=authorName size=#md />
      <Stack direction=[xs(#horizontal)] gap=[xs(#one(1.0))]>
        <Metadata> {`${readingTime->Belt.Int.toString}min`} </Metadata>
        <Typography tag=#span fontWeight=[xs(#700)] fontSize=[xs(14->#px)] color=[xs(#primary200)]>
          {`//`->React.string}
        </Typography>
        <Metadata> {published} </Metadata>
      </Stack>
    </Stack>
  </Stack>
}
