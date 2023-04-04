open AncestorSpacy

let default = () => {
  <Stack pt=[xs(14.0)] maxW=[xs(784->#px)] width=[xs(100.0->#pct)] gap=[xs(#one(2.0))]>
    <Stack
      direction=[xs(#horizontal)]
      alignItems=[xs(#center)]
      gap=[xs(#one(1.5))]
      divider={<Base tag=#span fontSize=[xs(2.0->#rem)] color=[xs(#primary200)]>
        {"//"->React.string}
      </Base>}>
      <ProfileName name="Jeff Jarvis" />
      <Typography tag=#span fontSize=[xs(16->#px)] fontWeight=[xs(#700)] color=[xs(#primary700)]>
        {"3min"->React.string}
      </Typography>
      <Typography tag=#span fontSize=[xs(16->#px)] fontWeight=[xs(#700)] color=[xs(#primary700)]>
        {"Mar 23, 2022"->React.string}
      </Typography>
    </Stack>
    <Stack gap=[xs(#one(2.0))]>
      <Typography
        m=[xs(0.0)]
        tag=#h1
        fontSize=[xs(3.6->#rem)]
        letterSpacing=[xs(-0.04->#em)]
        lineHeight=[xs(4.6->#rem)]
        color=[xs(#primary700)]>
        {"The Cost of Consistency in UI Frameworks"->React.string}
      </Typography>
      <Typography
        m=[xs(0.0)]
        tag=#p
        color=[xs(#primary300)]
        fontSize=[xs(1.8->#rem)]
        lineHeight=[xs(2.8->#rem)]>
        {"Sometimes there are problems that have no universally good solutions. There is some tradeoff to be made. Some perspectives that can't be protected. Sometimes it isn't even clear if any of the options are preferable to the others."->React.string}
      </Typography>
    </Stack>
  </Stack>
}
