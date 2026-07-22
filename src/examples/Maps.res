// The exact same map, written once per container. The shape is identical —
// only the container changes. Why can't we write it a single time?
let optMap = (f: 'a => 'b, o: option<'a>): option<'b> => Belt.Option.map(o, f)

let arrMap = (f: 'a => 'b, a: array<'a>): array<'b> => Belt.Array.map(a, f)

let resMap = (f: 'a => 'b, r: result<'a, 'e>): result<'b, 'e> =>
  switch r {
  | Ok(x) => Ok(f(x))
  | Error(e) => Error(e)
  }
