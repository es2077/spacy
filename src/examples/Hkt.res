// Could we write ONE map for ANY container? We'd need a type variable that
// is itself a container — a type constructor applied to 'a:
type functorOps<'f> = {
  map: 'a 'b. ('a => 'b, 'f<'a>) => 'f<'b>,
}
