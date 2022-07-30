open AncestorSpacy

let roundedBorder = Emotion.css({
  "borderRadius": "50%",
  "fontFamily": Theme.Constants.fontFamily,
})

@react.component
let make = (~name, ~size as baseSize: float=1.0) => {
  let firstLetter = name->String.substring(~start=0, ~end=1)

  let size = #pxFloat(36.0 *. baseSize)
  let fontSize = #rem(1.8 *. baseSize)

  <Box
    display=[xs(#flex)]
    alignItems=[xs(#center)]
    justifyContent=[xs(#center)]
    fontWeight=[xs(#700)]
    width=[xs(size)]
    height=[xs(size)]
    bgColor=[xs(Theme.Colors.primary700)]
    color=[xs(Theme.Colors.primary100)]
    fontSize=[xs(fontSize)]
    className=roundedBorder>
    {firstLetter->React.string}
  </Box>
}
