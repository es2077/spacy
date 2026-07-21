// Index the type by what it evaluates to: expr<'a>. Add only accepts
// expr<int>, so ill-typed trees can't even be built.
type rec expr<_> =
  | Int(int): expr<int>
  | Bool(bool): expr<bool>
  | Add(expr<int>, expr<int>): expr<int>

// The `type a.` locally abstract type lets each branch refine `a`
// independently — exactly what inference alone could not do.
let rec eval: type a. expr<a> => a = e =>
  switch e {
  | Int(n) => n
  | Bool(b) => b
  | Add(a, b) => eval(a) + eval(b)
  }

// eval returns the *refined* type — a plain int here, no unwrapping.
let three: int = eval(Add(Int(1), Int(2)))

// On expr<int>, the Bool case is type-impossible, so we can leave it out
// with no exhaustiveness error — the compiler knows it can't occur.
let describe = (e: expr<int>) =>
  switch e {
  | Int(_) => "a literal int"
  | Add(_, _) => "a sum"
  }
