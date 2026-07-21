// A tiny expression language as a plain variant. eval must return a
// wrapped value, the result type is lost, and nothing stops us from
// building nonsense like adding a bool to an int.
type value =
  | VInt(int)
  | VBool(bool)

type rec expr =
  | Int(int)
  | Bool(bool)
  | Add(expr, expr)

let rec eval = e =>
  switch e {
  | Int(n) => VInt(n)
  | Bool(b) => VBool(b)
  | Add(a, b) =>
    switch (eval(a), eval(b)) {
    | (VInt(x), VInt(y)) => VInt(x + y)
    | _ => failwith("runtime type error")
    }
  }

// Nonsense — a bool added to an int — compiles just fine:
let nonsense = Add(Bool(true), Int(1))
