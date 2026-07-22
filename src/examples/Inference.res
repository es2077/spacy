// No type annotations anywhere — Hindley-Milner infers the most general
// type of each binding for us, staying polymorphic wherever it can.
let identity = x => x

let swap = ((a, b)) => (b, a)

let compose = (f, g, x) => f(g(x))

let firstOf = items =>
  switch items {
  | list{} => None
  | list{head, ..._} => Some(head)
  }
