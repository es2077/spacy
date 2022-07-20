module Colors = {
  let primary100 = #hex("#fafafa")
  let primary200 = #hex("#b1b1b1")
  let primary300 = #hex("#777777")
  let primary400 = #hex("#4F4F4F")
  let primary500 = #hex("#2C2C2C")
  let primary600 = #hex("#1D1D1D")
  let primary700 = #hex("#171717")

  let toString = Ancestor.Css.Color.toString
}

module ZIndex = {
  let aboveAll = 100
  let above = 50
  let base = 10
  let hidden = -1
}

module Constants = {
  let fontFamily = "DM Sans, sans-serif"
}

let spacing = AncestorSpacy.Styles.spacing
let radius = AncestorSpacy.Styles.radius
