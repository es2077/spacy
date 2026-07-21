// Index the type by what it evaluates to: expr<'a>. Add only accepts
// expr<int>, so ill-typed trees can't even be built.
type rec expr<_> =
  | Int(int): expr<int>
  | Bool(bool): expr<bool>
  | Add(expr<int>, expr<int>): expr<int>

// But plain inference can't type this eval: each branch returns a
// different type, and Hindley-Milner unifies them all into one.
let rec eval = e =>
  switch e {
  | Int(n) => n
  | Bool(b) => b
  | Add(a, b) => eval(a) + eval(b)
  }
