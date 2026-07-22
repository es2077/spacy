// The language has no syntax for 'f<'a>. Yallop & White's workaround:
// a "brand" type app<'f, 'a> that STANDS IN for 'f applied to 'a.
type app<'f, 'a>

// A brand is an empty type — no constructors, no values. It's a pure
// compile-time tag (like the phantom types from the GADT lesson) that
// names one container.
type optionBrand

// inj = INJECT: wrap a real option into the branded app type.
external injOption: option<'a> => app<optionBrand, 'a> = "%identity"
// prj = PROJECT: unwrap it back into a real option.
external prjOption: app<optionBrand, 'a> => option<'a> = "%identity"
// %identity: at runtime both are no-ops — the brand exists only in types.

// Round trip: inject, then project, gives the same value back.
let wrapped: app<optionBrand, int> = injOption(Some(42))
let back: option<int> = prjOption(wrapped) // Some(42)

// Now 'f ranges over BRANDS (kind *), so this is legal — one generic map.
// map goes: project out of the brand, run the real map, inject back in.
type functorOps<'f> = {map: 'a 'b. ('a => 'b, app<'f, 'a>) => app<'f, 'b>}

let optionFunctor: functorOps<optionBrand> = {
  map: (f, fa) => injOption(Belt.Option.map(prjOption(fa), f)),
}
