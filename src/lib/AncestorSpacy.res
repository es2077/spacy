include Ancestor.Make({
  type breakpoints<'value> = Ancestor.DefaultConfig.breakpoints<'value>
  let unboxBreakpointValue = Ancestor.DefaultConfig.unboxBreakpointValue
  let sizeByBreakpoints = Ancestor.DefaultConfig.sizeByBreakpoints

  let css = Emotion.rawCss

  type spacing = float
  type radius = float

  let spacing = v => #pxFloat(v *. 8.0)
  let radius = v => #pxFloat(v *. 8.0)
})

let xs = v => #xs(v)
let sm = v => #sm(v)
let md = v => #md(v)
let lg = v => #lg(v)
let xl = v => #xl(v)
