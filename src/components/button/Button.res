open AncestorSpacy

type size = [#sm | #md]

module Styles = {
  let button = (~size) =>
    Emotion.css({
      "height": switch size {
      | #sm => "42px"
      | #md => "52px"
      },
      "fontSize": switch size {
      | #sm => "14px"
      | #md => "16px"
      },
      "border": 0,
      "color": "#fafafa",
      "backgroundColor": "#000",
    })
}

@react.component
let make = (~label, ~size: size=#sm) => {
  <Base className={Styles.button(~size)} tag=#button> {label->React.string} </Base>
}
