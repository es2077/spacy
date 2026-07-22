// The type alone is a theorem. When 'a is fully polymorphic, the function
// can't inspect the value or fabricate one — its behaviour is pinned down.

// 'a => 'a has exactly one total inhabitant: identity.
let id: 'a. 'a => 'a = x => x

// ('a, 'a) => 'a can only be one of two functions: return the 1st or the 2nd.
let first: 'a. ('a, 'a) => 'a = (x, _y) => x
let second: 'a. ('a, 'a) => 'a = (_x, y) => y

// You can't even look at an 'a. The honest array<'a> => array<'a> can only
// rearrange what's already there.
let rev: 'a. array<'a> => array<'a> = xs => Belt.Array.reverse(xs)
