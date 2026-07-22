// A "kind" is the type of a type. `int` is a complete type — but is `array`?
let n: int = 42

// `array` needs a type argument. Using it bare should be an error:
let xs: array = [1, 2, 3]
