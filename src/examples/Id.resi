// An opaque, phantom-typed identifier. The 'kind parameter carries no data at
// runtime — it only lets the compiler tell a UserId from a PostId, even though
// both are plain strings. The interface also hides that it IS a string.
type t<'kind>

type user
type post

let userId: string => t<user>
let postId: string => t<post>
let toString: t<'kind> => string
