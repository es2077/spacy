open AncestorSpacy

@react.component
let make = () => {
  <Modal.Content>
    <Modal.Close />
    <Stack gap=[xs(#one(4.0))] minW=[xs(370->#px)] py=[xs(5.0)] px=[xs(4.0)]>
      <Typography
        fontSize=[xs(2.8->#rem)]
        fontWeight=[xs(#700)]
        letterSpacing=[xs(-0.02->#em)]
        color=[xs(#primary700)]>
        {"Sign in"->React.string}
      </Typography>
      <Stack gap=[xs(#one(3.0))]>
        <Input placeholder="Email" />
        <Input placeholder="Password" />
        <Button label="Sign in" />
      </Stack>
    </Stack>
  </Modal.Content>
}
