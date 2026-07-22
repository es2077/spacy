// Rank-2 polymorphism: a field that stays polymorphic. You must WRITE the
// 'a. yourself — HM inference can't produce it (inferring System F is
// undecidable). This is the ∀ from the last lesson's `type a.`, first-class.
type poly = {run: 'a. 'a => 'a}

// The same wrapped function is applied at TWO different types in one
// expression — impossible with an ordinary monomorphic parameter.
let probe = (p: poly) => (p.run(42), p.run("hello"))

let identity = {run: x => x}

// One genuinely polymorphic value serves both types at once:
let pair = probe(identity) // (42, "hello")
