open AncestorSpacy

type size = [#lg | #md]

@react.component
let make = (~size: size=#lg, ~name) => {
  let avatarSize = switch size {
  | #lg => 1.0
  | #md => 0.8
  }

  let fontSize = switch size {
  | #lg => #rem(1.6)
  | #md => #rem(1.4)
  }

  <Stack alignItems=[xs(#center)] gap=[xs(#one(1.0))]>
    <Avatar size=avatarSize name />
    <Typography
      fontSize=[xs(fontSize)]
      color=[xs(#primary700)]
      fontWeight=[xs(#700)]
      letterSpacing=[xs(-0.05->#em)]>
      {name->React.string}
    </Typography>
  </Stack>
}
