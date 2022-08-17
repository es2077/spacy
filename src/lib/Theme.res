module Colors = {
  type t = [
    | #primary100
    | #primary200
    | #primary300
    | #primary400
    | #primary500
    | #primary600
    | #primary700
    | #red
  ]

  let color = (color: t) =>
    switch color {
    | #primary100 => #hex("#fafafa")
    | #primary200 => #hex("#b1b1b1")
    | #primary300 => #hex("#777777")
    | #primary400 => #hex("#4F4F4F")
    | #primary500 => #hex("#2C2C2C")
    | #primary600 => #hex("#1D1D1D")
    | #primary700 => #hex("#171717")
    | #red => #hex("#FF1E54")
    }

  let make = (v: t) => v->color->Ancestor.Css.Color.toString
}

module ZIndex = {
  type t = [
    | #base
    | #hidden
    | #above
    | #aboveAll
  ]

  let make = (v: t) =>
    switch v {
    | #aboveAll => 100
    | #above => 50
    | #base => 10
    | #hidden => -1
    }
}

module Constants = {
  let fontFamily = "DM Sans, sans-serif"
}

module Spacing = {
  type t = float

  let spacing = v => #pxFloat(v *. 8.0)
  let make = v => v->spacing->Ancestor.Css.Length.toString
}

module Radius = {
  type t = float

  let radius = v => #pxFloat(v *. 8.0)
  let make = v => v->radius->Ancestor.Css.Length.toString
}

let spacing = Spacing.make
let radius = Radius.make
let colors = Colors.make
let zIndex = ZIndex.make
