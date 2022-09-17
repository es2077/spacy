open AncestorSpacy

@react.component
let make = () =>
  <Stack
    py=[xs(3.0)]
    borderTop=[(1->#px, #solid, #primary200)->xs]
    direction=[xs(#horizontal)]
    justifyContent=[xs(#"space-between")]
    tag=#footer>
    <Typography
      m=[xs(0.0)] color=[xs(#primary300)] fontSize=[xs(18->#px)] fontWeight=[xs(#500)] tag=#p>
      {`Made with `->React.string}
      <Typography
        href="https://rescript-lang.org"
        target="_blank"
        color=[xs(#primary700)]
        fontWeight=[xs(#700)]
        tag=#a>
        {`ReScript`->React.string}
      </Typography>
      {` and `->React.string}
      <Typography
        href="https://nextjs.org"
        target="_blank"
        color=[xs(#primary700)]
        fontWeight=[xs(#700)]
        tag=#a>
        {`Next.js`->React.string}
      </Typography>
    </Typography>
    <Typography
      m=[xs(0.0)] color=[xs(#primary300)] fontSize=[xs(18->#px)] fontWeight=[xs(#500)] tag=#p>
      {`© Copyright Spacy - All rights reserved`->React.string}
    </Typography>
  </Stack>
