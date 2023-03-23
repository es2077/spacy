open AncestorSpacy

@react.component
let make = (~children) => {
  <Stack mt=[xs(14.0)] gap=[xs(#one(2.0))] alignItems=[xs(#center)]> children </Stack>
}

module Title = {
  @react.component
  let make = () => {
    <Typography
      color=[xs(#primary700)]
      letterSpacing=[xs(-0.055->#em)]
      fontSize=[xs(4.2->#rem)]
      m=[xs(0.0)]
      fontWeight=[xs(#700)]
      textAlign=[xs(#center)]
      tag=#h1>
      {`Stay curious.`->React.string}
    </Typography>
  }
}

module Text = {
  @react.component
  let make = () => {
    <Typography
      m=[xs(0.0)]
      color=[xs(#primary300)]
      fontSize=[xs(2.4->#rem)]
      fontWeight=[xs(#400)]
      lineHeight=[xs(3.4->#rem)]
      letterSpacing=[xs(-0.035->#em)]
      textAlign=[xs(#center)]
      tag=#p>
      {`Discover stories, thinking, and expertise from writers on any topic.`->React.string}
    </Typography>
  }
}
