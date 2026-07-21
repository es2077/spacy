// greetUser only accepts a UserId — a compile-time guarantee, not a naming
// convention we hope everyone remembers to follow.
let greetUser = (id: Id.t<Id.user>) => "Hello, " ++ Id.toString(id)

let message = greetUser(Id.userId("user-7"))
