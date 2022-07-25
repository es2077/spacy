module Styles = {
  open Emotion

  let rotate = keyframes({
    "100%": {
      "transform": "rotate(360deg)",
    },
  })

  let dash = keyframes({
    "0%": {
      "strokeDasharray": "1, 150",
      "strokeDashoffset": 0,
    },
    "50%": {
      "strokeDasharray": "90, 150",
    },
    "100%": {
      "strokeDasharray": "90, 150",
      "strokeDashoffset": -124,
    },
  })

  let spinner = (~size) =>
    css({
      "animation": `${rotate} 2s linear infinite`,
      "width": size->Ancestor.Css.Length.toString,
      "height": size->Ancestor.Css.Length.toString,
    })

  let spinnerBg = (~color) =>
    css({
      "stroke": color->Ancestor.Css.Color.toString,
      "opacity": 0.3,
    })

  let circle = (~color) =>
    css({
      "stroke": color->Ancestor.Css.Color.toString,
      "animation": `${dash} 1.5s ease-in-out infinite`,
    })
}
@react.component
let make = (~color=#hex("#000"), ~background=#hex("#cecece"), ~size=#rem(5.2)) => {
  <svg className={Styles.spinner(~size)} viewBox="0 0 50 50">
    <span />
    <circle
      className={Styles.spinnerBg(~color=background)}
      cx="25"
      cy="25"
      r="20"
      fill="none"
      strokeWidth="6"
    />
    <circle
      className={Styles.circle(~color)}
      strokeLinecap="round"
      cx="25"
      cy="25"
      r="20"
      fill="none"
      strokeWidth="6"
    />
  </svg>
}
