open AncestorSpacy

@react.component
let make = () =>
  <Stack
    width=[xs(100.0->#pct)]
    justifyContent=[xs(#"space-between")]
    direction=[xs(#horizontal)]
    tag=#header>
    <Logo /> <Button label=`Sign in` />
  </Stack>
