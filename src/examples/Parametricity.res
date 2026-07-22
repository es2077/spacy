// The type alone is a theorem. When 'a is fully polymorphic, the function
// can't inspect the value or fabricate one — its behaviour is pinned down.

// 'a => 'a has exactly one total inhabitant: identity.
let id: 'a. 'a => 'a = x => x

// ('a, 'a) => 'a can only be one of two functions: return the 1st or the 2nd.
let first: 'a. ('a, 'a) => 'a = (x, _y) => x
let second: 'a. ('a, 'a) => 'a = (_x, y) => y

// Can we write array<'a> => array<'a> that bumps each element by one?
let mapPlus1: 'a. array<'a> => array<'a> = xs => xs->Belt.Array.map(x => x + 1)
