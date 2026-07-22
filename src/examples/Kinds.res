// A "kind" is the type of a type.

// kind *  — a COMPLETE type; you can annotate a value with it.
let n: int = 42
let s: string = "hi"

// `array` alone is NOT complete — it needs a type argument first.
// `array<int>` is complete (kind *); `array` by itself is kind * -> *.
let xs: array<int> = [1, 2, 3]

// option and result are the same: type CONSTRUCTORS, not types.
let maybe: option<int> = Some(1)
let res: result<int, string> = Ok(1)
