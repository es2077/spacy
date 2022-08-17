include Ancestor.Make({
  open Ancestor.DefaultConfig
  type breakpoints<'value> = breakpoints<'value>
  let unboxBreakpointValue = unboxBreakpointValue
  let sizeByBreakpoints = sizeByBreakpoints

  let css = Emotion.rawCss

  type spacing = float
  type radius = float
  type colors = Theme.Colors.t
  type zIndex = Theme.ZIndex.t

  let spacing = Theme.Spacing.spacing
  let radius = Theme.Radius.radius
  let colors = Theme.Colors.color
  let zIndex = Theme.zIndex
})

let xs = v => #xs(v)
let sm = v => #sm(v)
let md = v => #md(v)
let lg = v => #lg(v)
let xl = v => #xl(v)
