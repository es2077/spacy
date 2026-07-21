// greetUser only accepts a UserId — a compile-time guarantee, not a naming
// convention we hope everyone remembers to follow.
let greetUser = (id: Id.t<Id.user>) => "Hello, " ++ Id.toString(id)

// A PostId is not a UserId — both are strings at runtime, but this won't build.
let message = greetUser(Id.postId("post-42"))
