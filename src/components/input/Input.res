open AncestorSpacy

module Styles = {
  open Emotion

  let input = (~error) =>
    css({
      "height": 42,
      "padding": `0 ${Theme.spacing(2.0)}`,
      "fontFamily": Theme.Constants.fontFamily,
      "fontSize": `1.8rem`,
      "letterSpacing": `-0.02em`,
      "fontWeight": 500,
      "backgroundColor": Polished.transparentize(0.92, Theme.colors(#primary600)),
      "border": 0,
      "outline": 0,
      "borderRadius": Theme.radius(0.5),
      "color": switch error {
      | None => Theme.colors(#primary600)
      | Some(_) => Theme.colors(#red)
      },
      "&:disabled": {
        "cursor": "not-allowed",
        "opacity": 0.7,
      },
      "::placeholder": {
        "color": Theme.colors(#primary300),
      },
    })

  let error = css({
    "color": Theme.colors(#red),
    "fontSize": `1.2rem`,
    "fontFamily": Theme.Constants.fontFamily,
    "fontWeight": 500,
    "letterSpacing": `-0.02em`,
  })
}

@react.component
let make = (
  ~autoFocus=?,
  ~value=?,
  ~placeholder=?,
  ~onChange=?,
  ~type_=?,
  ~disabled=false,
  ~error: option<string>=?,
) => {
  <Stack gap=[xs(#one(1.0))]>
    <Base
      className={Styles.input(~error)}
      tag=#input
      ?autoFocus
      ?value
      ?placeholder
      ?onChange
      ?type_
      disabled
    />
    {switch error {
    | None => React.null
    | Some(message) => <Base tag=#span className=Styles.error> {message->React.string} </Base>
    }}
  </Stack>
}
