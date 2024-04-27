/* @generated */
@@ocaml.warning("-30")

@live
type enum_ArticlesConstraint = private [>
  | #articles_pkey
]

@live
type enum_ArticlesConstraint_input = [
  | #articles_pkey
]

@live
type enum_ArticlesSelectColumn = private [>
  | #authorId
  | #body
  | #createdAt
  | #id
  | #intro
  | #updatedAt
]

@live
type enum_ArticlesSelectColumn_input = [
  | #authorId
  | #body
  | #createdAt
  | #id
  | #intro
  | #updatedAt
]

@live
type enum_ArticlesUpdateColumn = private [>
  | #authorId
  | #body
  | #createdAt
  | #id
  | #intro
  | #updatedAt
]

@live
type enum_ArticlesUpdateColumn_input = [
  | #authorId
  | #body
  | #createdAt
  | #id
  | #intro
  | #updatedAt
]

@live
type enum_OrderBy = private [>
  | #ASC
  | #ASC_NULLS_FIRST
  | #ASC_NULLS_LAST
  | #DESC
  | #DESC_NULLS_FIRST
  | #DESC_NULLS_LAST
]

@live
type enum_OrderBy_input = [
  | #ASC
  | #ASC_NULLS_FIRST
  | #ASC_NULLS_LAST
  | #DESC
  | #DESC_NULLS_FIRST
  | #DESC_NULLS_LAST
]

@live
type enum_UsersConstraint = private [>
  | #users_email_key
  | #users_pkey
  | #users_username_key
]

@live
type enum_UsersConstraint_input = [
  | #users_email_key
  | #users_pkey
  | #users_username_key
]

@live
type enum_UsersSelectColumn = private [>
  | #avatarUrl
  | #bio
  | #createdAt
  | #email
  | #id
  | #password
  | #updatedAt
  | #username
]

@live
type enum_UsersSelectColumn_input = [
  | #avatarUrl
  | #bio
  | #createdAt
  | #email
  | #id
  | #password
  | #updatedAt
  | #username
]

@live
type enum_UsersUpdateColumn = private [>
  | #avatarUrl
  | #bio
  | #createdAt
  | #email
  | #id
  | #password
  | #updatedAt
  | #username
]

@live
type enum_UsersUpdateColumn_input = [
  | #avatarUrl
  | #bio
  | #createdAt
  | #email
  | #id
  | #password
  | #updatedAt
  | #username
]

@live
type enum_RequiredFieldAction = private [>
  | #NONE
  | #LOG
  | #THROW
]

@live
type enum_RequiredFieldAction_input = [
  | #NONE
  | #LOG
  | #THROW
]

@live
type rec input_ArticlesBoolExp = {
  _and: option<array<input_ArticlesBoolExp>>,
  _not: option<input_ArticlesBoolExp>,
  _or: option<array<input_ArticlesBoolExp>>,
  authorId: option<input_UuidComparisonExp>,
  body: option<input_StringComparisonExp>,
  createdAt: option<input_TimestamptzComparisonExp>,
  id: option<input_UuidComparisonExp>,
  intro: option<input_StringComparisonExp>,
  updatedAt: option<input_TimestamptzComparisonExp>,
}

@live
and input_ArticlesBoolExp_nullable = {
  _and?: Js.Null.t<array<input_ArticlesBoolExp_nullable>>,
  _not?: Js.Null.t<input_ArticlesBoolExp_nullable>,
  _or?: Js.Null.t<array<input_ArticlesBoolExp_nullable>>,
  authorId?: Js.Null.t<input_UuidComparisonExp_nullable>,
  body?: Js.Null.t<input_StringComparisonExp_nullable>,
  createdAt?: Js.Null.t<input_TimestamptzComparisonExp_nullable>,
  id?: Js.Null.t<input_UuidComparisonExp_nullable>,
  intro?: Js.Null.t<input_StringComparisonExp_nullable>,
  updatedAt?: Js.Null.t<input_TimestamptzComparisonExp_nullable>,
}

@live
and input_ArticlesInsertInput = {
  authorId: option<RescriptRelay.any>,
  body: option<string>,
  createdAt: option<RescriptRelay.any>,
  id: option<RescriptRelay.any>,
  intro: option<string>,
  updatedAt: option<RescriptRelay.any>,
}

@live
and input_ArticlesInsertInput_nullable = {
  authorId?: Js.Null.t<RescriptRelay.any>,
  body?: Js.Null.t<string>,
  createdAt?: Js.Null.t<RescriptRelay.any>,
  id?: Js.Null.t<RescriptRelay.any>,
  intro?: Js.Null.t<string>,
  updatedAt?: Js.Null.t<RescriptRelay.any>,
}

@live
and input_ArticlesOnConflict = {
  @as("constraint") constraint_: [#articles_pkey],
  updateColumns: array<[#authorId | #body | #createdAt | #id | #intro | #updatedAt]>,
  where: option<input_ArticlesBoolExp>,
}

@live
and input_ArticlesOnConflict_nullable = {
  @as("constraint") constraint_: [#articles_pkey],
  updateColumns: array<[#authorId | #body | #createdAt | #id | #intro | #updatedAt]>,
  where?: Js.Null.t<input_ArticlesBoolExp_nullable>,
}

@live
and input_ArticlesOrderBy = {
  authorId: option<[#ASC | #ASC_NULLS_FIRST | #ASC_NULLS_LAST | #DESC | #DESC_NULLS_FIRST | #DESC_NULLS_LAST]>,
  body: option<[#ASC | #ASC_NULLS_FIRST | #ASC_NULLS_LAST | #DESC | #DESC_NULLS_FIRST | #DESC_NULLS_LAST]>,
  createdAt: option<[#ASC | #ASC_NULLS_FIRST | #ASC_NULLS_LAST | #DESC | #DESC_NULLS_FIRST | #DESC_NULLS_LAST]>,
  id: option<[#ASC | #ASC_NULLS_FIRST | #ASC_NULLS_LAST | #DESC | #DESC_NULLS_FIRST | #DESC_NULLS_LAST]>,
  intro: option<[#ASC | #ASC_NULLS_FIRST | #ASC_NULLS_LAST | #DESC | #DESC_NULLS_FIRST | #DESC_NULLS_LAST]>,
  updatedAt: option<[#ASC | #ASC_NULLS_FIRST | #ASC_NULLS_LAST | #DESC | #DESC_NULLS_FIRST | #DESC_NULLS_LAST]>,
}

@live
and input_ArticlesOrderBy_nullable = {
  authorId?: Js.Null.t<[#ASC | #ASC_NULLS_FIRST | #ASC_NULLS_LAST | #DESC | #DESC_NULLS_FIRST | #DESC_NULLS_LAST]>,
  body?: Js.Null.t<[#ASC | #ASC_NULLS_FIRST | #ASC_NULLS_LAST | #DESC | #DESC_NULLS_FIRST | #DESC_NULLS_LAST]>,
  createdAt?: Js.Null.t<[#ASC | #ASC_NULLS_FIRST | #ASC_NULLS_LAST | #DESC | #DESC_NULLS_FIRST | #DESC_NULLS_LAST]>,
  id?: Js.Null.t<[#ASC | #ASC_NULLS_FIRST | #ASC_NULLS_LAST | #DESC | #DESC_NULLS_FIRST | #DESC_NULLS_LAST]>,
  intro?: Js.Null.t<[#ASC | #ASC_NULLS_FIRST | #ASC_NULLS_LAST | #DESC | #DESC_NULLS_FIRST | #DESC_NULLS_LAST]>,
  updatedAt?: Js.Null.t<[#ASC | #ASC_NULLS_FIRST | #ASC_NULLS_LAST | #DESC | #DESC_NULLS_FIRST | #DESC_NULLS_LAST]>,
}

@live
and input_ArticlesPkColumnsInput = {
  id: RescriptRelay.any,
}

@live
and input_ArticlesPkColumnsInput_nullable = {
  id: RescriptRelay.any,
}

@live
and input_ArticlesSetInput = {
  authorId: option<RescriptRelay.any>,
  body: option<string>,
  createdAt: option<RescriptRelay.any>,
  id: option<RescriptRelay.any>,
  intro: option<string>,
  updatedAt: option<RescriptRelay.any>,
}

@live
and input_ArticlesSetInput_nullable = {
  authorId?: Js.Null.t<RescriptRelay.any>,
  body?: Js.Null.t<string>,
  createdAt?: Js.Null.t<RescriptRelay.any>,
  id?: Js.Null.t<RescriptRelay.any>,
  intro?: Js.Null.t<string>,
  updatedAt?: Js.Null.t<RescriptRelay.any>,
}

@live
and input_ArticlesUpdates = {
  _set: option<input_ArticlesSetInput>,
  where: input_ArticlesBoolExp,
}

@live
and input_ArticlesUpdates_nullable = {
  _set?: Js.Null.t<input_ArticlesSetInput_nullable>,
  where: input_ArticlesBoolExp_nullable,
}

@live
and input_LoginInput = {
  email: string,
  password: string,
}

@live
and input_LoginInput_nullable = {
  email: string,
  password: string,
}

@live
and input_SignUpInput = {
  bio: string,
  email: string,
  password: string,
  username: string,
}

@live
and input_SignUpInput_nullable = {
  bio: string,
  email: string,
  password: string,
  username: string,
}

@live
and input_StringComparisonExp = {
  _eq: option<string>,
  _gt: option<string>,
  _gte: option<string>,
  _ilike: option<string>,
  _in: option<array<string>>,
  _iregex: option<string>,
  _isNull: option<bool>,
  _like: option<string>,
  _lt: option<string>,
  _lte: option<string>,
  _neq: option<string>,
  _nilike: option<string>,
  _nin: option<array<string>>,
  _niregex: option<string>,
  _nlike: option<string>,
  _nregex: option<string>,
  _nsimilar: option<string>,
  _regex: option<string>,
  _similar: option<string>,
}

@live
and input_StringComparisonExp_nullable = {
  _eq?: Js.Null.t<string>,
  _gt?: Js.Null.t<string>,
  _gte?: Js.Null.t<string>,
  _ilike?: Js.Null.t<string>,
  _in?: Js.Null.t<array<string>>,
  _iregex?: Js.Null.t<string>,
  _isNull?: Js.Null.t<bool>,
  _like?: Js.Null.t<string>,
  _lt?: Js.Null.t<string>,
  _lte?: Js.Null.t<string>,
  _neq?: Js.Null.t<string>,
  _nilike?: Js.Null.t<string>,
  _nin?: Js.Null.t<array<string>>,
  _niregex?: Js.Null.t<string>,
  _nlike?: Js.Null.t<string>,
  _nregex?: Js.Null.t<string>,
  _nsimilar?: Js.Null.t<string>,
  _regex?: Js.Null.t<string>,
  _similar?: Js.Null.t<string>,
}

@live
and input_TimestamptzComparisonExp = {
  _eq: option<RescriptRelay.any>,
  _gt: option<RescriptRelay.any>,
  _gte: option<RescriptRelay.any>,
  _in: option<array<RescriptRelay.any>>,
  _isNull: option<bool>,
  _lt: option<RescriptRelay.any>,
  _lte: option<RescriptRelay.any>,
  _neq: option<RescriptRelay.any>,
  _nin: option<array<RescriptRelay.any>>,
}

@live
and input_TimestamptzComparisonExp_nullable = {
  _eq?: Js.Null.t<RescriptRelay.any>,
  _gt?: Js.Null.t<RescriptRelay.any>,
  _gte?: Js.Null.t<RescriptRelay.any>,
  _in?: Js.Null.t<array<RescriptRelay.any>>,
  _isNull?: Js.Null.t<bool>,
  _lt?: Js.Null.t<RescriptRelay.any>,
  _lte?: Js.Null.t<RescriptRelay.any>,
  _neq?: Js.Null.t<RescriptRelay.any>,
  _nin?: Js.Null.t<array<RescriptRelay.any>>,
}

@live
and input_UsersBoolExp = {
  _and: option<array<input_UsersBoolExp>>,
  _not: option<input_UsersBoolExp>,
  _or: option<array<input_UsersBoolExp>>,
  avatarUrl: option<input_StringComparisonExp>,
  bio: option<input_StringComparisonExp>,
  createdAt: option<input_TimestamptzComparisonExp>,
  email: option<input_StringComparisonExp>,
  id: option<input_UuidComparisonExp>,
  password: option<input_StringComparisonExp>,
  updatedAt: option<input_TimestamptzComparisonExp>,
  username: option<input_StringComparisonExp>,
}

@live
and input_UsersBoolExp_nullable = {
  _and?: Js.Null.t<array<input_UsersBoolExp_nullable>>,
  _not?: Js.Null.t<input_UsersBoolExp_nullable>,
  _or?: Js.Null.t<array<input_UsersBoolExp_nullable>>,
  avatarUrl?: Js.Null.t<input_StringComparisonExp_nullable>,
  bio?: Js.Null.t<input_StringComparisonExp_nullable>,
  createdAt?: Js.Null.t<input_TimestamptzComparisonExp_nullable>,
  email?: Js.Null.t<input_StringComparisonExp_nullable>,
  id?: Js.Null.t<input_UuidComparisonExp_nullable>,
  password?: Js.Null.t<input_StringComparisonExp_nullable>,
  updatedAt?: Js.Null.t<input_TimestamptzComparisonExp_nullable>,
  username?: Js.Null.t<input_StringComparisonExp_nullable>,
}

@live
and input_UsersInsertInput = {
  avatarUrl: option<string>,
  bio: option<string>,
  createdAt: option<RescriptRelay.any>,
  email: option<string>,
  id: option<RescriptRelay.any>,
  password: option<string>,
  updatedAt: option<RescriptRelay.any>,
  username: option<string>,
}

@live
and input_UsersInsertInput_nullable = {
  avatarUrl?: Js.Null.t<string>,
  bio?: Js.Null.t<string>,
  createdAt?: Js.Null.t<RescriptRelay.any>,
  email?: Js.Null.t<string>,
  id?: Js.Null.t<RescriptRelay.any>,
  password?: Js.Null.t<string>,
  updatedAt?: Js.Null.t<RescriptRelay.any>,
  username?: Js.Null.t<string>,
}

@live
and input_UsersOnConflict = {
  @as("constraint") constraint_: [#users_email_key | #users_pkey | #users_username_key],
  updateColumns: array<[#avatarUrl | #bio | #createdAt | #email | #id | #password | #updatedAt | #username]>,
  where: option<input_UsersBoolExp>,
}

@live
and input_UsersOnConflict_nullable = {
  @as("constraint") constraint_: [#users_email_key | #users_pkey | #users_username_key],
  updateColumns: array<[#avatarUrl | #bio | #createdAt | #email | #id | #password | #updatedAt | #username]>,
  where?: Js.Null.t<input_UsersBoolExp_nullable>,
}

@live
and input_UsersOrderBy = {
  avatarUrl: option<[#ASC | #ASC_NULLS_FIRST | #ASC_NULLS_LAST | #DESC | #DESC_NULLS_FIRST | #DESC_NULLS_LAST]>,
  bio: option<[#ASC | #ASC_NULLS_FIRST | #ASC_NULLS_LAST | #DESC | #DESC_NULLS_FIRST | #DESC_NULLS_LAST]>,
  createdAt: option<[#ASC | #ASC_NULLS_FIRST | #ASC_NULLS_LAST | #DESC | #DESC_NULLS_FIRST | #DESC_NULLS_LAST]>,
  email: option<[#ASC | #ASC_NULLS_FIRST | #ASC_NULLS_LAST | #DESC | #DESC_NULLS_FIRST | #DESC_NULLS_LAST]>,
  id: option<[#ASC | #ASC_NULLS_FIRST | #ASC_NULLS_LAST | #DESC | #DESC_NULLS_FIRST | #DESC_NULLS_LAST]>,
  password: option<[#ASC | #ASC_NULLS_FIRST | #ASC_NULLS_LAST | #DESC | #DESC_NULLS_FIRST | #DESC_NULLS_LAST]>,
  updatedAt: option<[#ASC | #ASC_NULLS_FIRST | #ASC_NULLS_LAST | #DESC | #DESC_NULLS_FIRST | #DESC_NULLS_LAST]>,
  username: option<[#ASC | #ASC_NULLS_FIRST | #ASC_NULLS_LAST | #DESC | #DESC_NULLS_FIRST | #DESC_NULLS_LAST]>,
}

@live
and input_UsersOrderBy_nullable = {
  avatarUrl?: Js.Null.t<[#ASC | #ASC_NULLS_FIRST | #ASC_NULLS_LAST | #DESC | #DESC_NULLS_FIRST | #DESC_NULLS_LAST]>,
  bio?: Js.Null.t<[#ASC | #ASC_NULLS_FIRST | #ASC_NULLS_LAST | #DESC | #DESC_NULLS_FIRST | #DESC_NULLS_LAST]>,
  createdAt?: Js.Null.t<[#ASC | #ASC_NULLS_FIRST | #ASC_NULLS_LAST | #DESC | #DESC_NULLS_FIRST | #DESC_NULLS_LAST]>,
  email?: Js.Null.t<[#ASC | #ASC_NULLS_FIRST | #ASC_NULLS_LAST | #DESC | #DESC_NULLS_FIRST | #DESC_NULLS_LAST]>,
  id?: Js.Null.t<[#ASC | #ASC_NULLS_FIRST | #ASC_NULLS_LAST | #DESC | #DESC_NULLS_FIRST | #DESC_NULLS_LAST]>,
  password?: Js.Null.t<[#ASC | #ASC_NULLS_FIRST | #ASC_NULLS_LAST | #DESC | #DESC_NULLS_FIRST | #DESC_NULLS_LAST]>,
  updatedAt?: Js.Null.t<[#ASC | #ASC_NULLS_FIRST | #ASC_NULLS_LAST | #DESC | #DESC_NULLS_FIRST | #DESC_NULLS_LAST]>,
  username?: Js.Null.t<[#ASC | #ASC_NULLS_FIRST | #ASC_NULLS_LAST | #DESC | #DESC_NULLS_FIRST | #DESC_NULLS_LAST]>,
}

@live
and input_UsersPkColumnsInput = {
  id: RescriptRelay.any,
}

@live
and input_UsersPkColumnsInput_nullable = {
  id: RescriptRelay.any,
}

@live
and input_UsersSetInput = {
  avatarUrl: option<string>,
  bio: option<string>,
  createdAt: option<RescriptRelay.any>,
  email: option<string>,
  id: option<RescriptRelay.any>,
  password: option<string>,
  updatedAt: option<RescriptRelay.any>,
  username: option<string>,
}

@live
and input_UsersSetInput_nullable = {
  avatarUrl?: Js.Null.t<string>,
  bio?: Js.Null.t<string>,
  createdAt?: Js.Null.t<RescriptRelay.any>,
  email?: Js.Null.t<string>,
  id?: Js.Null.t<RescriptRelay.any>,
  password?: Js.Null.t<string>,
  updatedAt?: Js.Null.t<RescriptRelay.any>,
  username?: Js.Null.t<string>,
}

@live
and input_UsersUpdates = {
  _set: option<input_UsersSetInput>,
  where: input_UsersBoolExp,
}

@live
and input_UsersUpdates_nullable = {
  _set?: Js.Null.t<input_UsersSetInput_nullable>,
  where: input_UsersBoolExp_nullable,
}

@live
and input_UuidComparisonExp = {
  _eq: option<RescriptRelay.any>,
  _gt: option<RescriptRelay.any>,
  _gte: option<RescriptRelay.any>,
  _in: option<array<RescriptRelay.any>>,
  _isNull: option<bool>,
  _lt: option<RescriptRelay.any>,
  _lte: option<RescriptRelay.any>,
  _neq: option<RescriptRelay.any>,
  _nin: option<array<RescriptRelay.any>>,
}

@live
and input_UuidComparisonExp_nullable = {
  _eq?: Js.Null.t<RescriptRelay.any>,
  _gt?: Js.Null.t<RescriptRelay.any>,
  _gte?: Js.Null.t<RescriptRelay.any>,
  _in?: Js.Null.t<array<RescriptRelay.any>>,
  _isNull?: Js.Null.t<bool>,
  _lt?: Js.Null.t<RescriptRelay.any>,
  _lte?: Js.Null.t<RescriptRelay.any>,
  _neq?: Js.Null.t<RescriptRelay.any>,
  _nin?: Js.Null.t<array<RescriptRelay.any>>,
}
@live @obj
external make_ArticlesBoolExp: (
  ~_and: array<input_ArticlesBoolExp>=?,
  ~_not: input_ArticlesBoolExp=?,
  ~_or: array<input_ArticlesBoolExp>=?,
  ~authorId: input_UuidComparisonExp=?,
  ~body: input_StringComparisonExp=?,
  ~createdAt: input_TimestamptzComparisonExp=?,
  ~id: input_UuidComparisonExp=?,
  ~intro: input_StringComparisonExp=?,
  ~updatedAt: input_TimestamptzComparisonExp=?,
  unit,
) => input_ArticlesBoolExp = ""

@live @obj
external make_ArticlesInsertInput: (
  ~authorId: RescriptRelay.any=?,
  ~body: string=?,
  ~createdAt: RescriptRelay.any=?,
  ~id: RescriptRelay.any=?,
  ~intro: string=?,
  ~updatedAt: RescriptRelay.any=?,
  unit,
) => input_ArticlesInsertInput = ""

@live @obj
external make_ArticlesOnConflict: (
  ~_constraint: [#articles_pkey],
  ~updateColumns: array<[#authorId | #body | #createdAt | #id | #intro | #updatedAt]>,
  ~where: input_ArticlesBoolExp=?,
  unit,
) => input_ArticlesOnConflict = ""

@live @obj
external make_ArticlesOrderBy: (
  ~authorId: [#ASC | #ASC_NULLS_FIRST | #ASC_NULLS_LAST | #DESC | #DESC_NULLS_FIRST | #DESC_NULLS_LAST]=?,
  ~body: [#ASC | #ASC_NULLS_FIRST | #ASC_NULLS_LAST | #DESC | #DESC_NULLS_FIRST | #DESC_NULLS_LAST]=?,
  ~createdAt: [#ASC | #ASC_NULLS_FIRST | #ASC_NULLS_LAST | #DESC | #DESC_NULLS_FIRST | #DESC_NULLS_LAST]=?,
  ~id: [#ASC | #ASC_NULLS_FIRST | #ASC_NULLS_LAST | #DESC | #DESC_NULLS_FIRST | #DESC_NULLS_LAST]=?,
  ~intro: [#ASC | #ASC_NULLS_FIRST | #ASC_NULLS_LAST | #DESC | #DESC_NULLS_FIRST | #DESC_NULLS_LAST]=?,
  ~updatedAt: [#ASC | #ASC_NULLS_FIRST | #ASC_NULLS_LAST | #DESC | #DESC_NULLS_FIRST | #DESC_NULLS_LAST]=?,
  unit,
) => input_ArticlesOrderBy = ""

@live @obj
external make_ArticlesPkColumnsInput: (
  ~id: RescriptRelay.any,
) => input_ArticlesPkColumnsInput = ""

@live @obj
external make_ArticlesSetInput: (
  ~authorId: RescriptRelay.any=?,
  ~body: string=?,
  ~createdAt: RescriptRelay.any=?,
  ~id: RescriptRelay.any=?,
  ~intro: string=?,
  ~updatedAt: RescriptRelay.any=?,
  unit,
) => input_ArticlesSetInput = ""

@live @obj
external make_ArticlesUpdates: (
  ~_set: input_ArticlesSetInput=?,
  ~where: input_ArticlesBoolExp,
  unit,
) => input_ArticlesUpdates = ""

@live @obj
external make_LoginInput: (
  ~email: string,
  ~password: string,
) => input_LoginInput = ""

@live @obj
external make_SignUpInput: (
  ~bio: string,
  ~email: string,
  ~password: string,
  ~username: string,
) => input_SignUpInput = ""

@live @obj
external make_StringComparisonExp: (
  ~_eq: string=?,
  ~_gt: string=?,
  ~_gte: string=?,
  ~_ilike: string=?,
  ~_in: array<string>=?,
  ~_iregex: string=?,
  ~_isNull: bool=?,
  ~_like: string=?,
  ~_lt: string=?,
  ~_lte: string=?,
  ~_neq: string=?,
  ~_nilike: string=?,
  ~_nin: array<string>=?,
  ~_niregex: string=?,
  ~_nlike: string=?,
  ~_nregex: string=?,
  ~_nsimilar: string=?,
  ~_regex: string=?,
  ~_similar: string=?,
  unit,
) => input_StringComparisonExp = ""

@live @obj
external make_TimestamptzComparisonExp: (
  ~_eq: RescriptRelay.any=?,
  ~_gt: RescriptRelay.any=?,
  ~_gte: RescriptRelay.any=?,
  ~_in: array<RescriptRelay.any>=?,
  ~_isNull: bool=?,
  ~_lt: RescriptRelay.any=?,
  ~_lte: RescriptRelay.any=?,
  ~_neq: RescriptRelay.any=?,
  ~_nin: array<RescriptRelay.any>=?,
  unit,
) => input_TimestamptzComparisonExp = ""

@live @obj
external make_UsersBoolExp: (
  ~_and: array<input_UsersBoolExp>=?,
  ~_not: input_UsersBoolExp=?,
  ~_or: array<input_UsersBoolExp>=?,
  ~avatarUrl: input_StringComparisonExp=?,
  ~bio: input_StringComparisonExp=?,
  ~createdAt: input_TimestamptzComparisonExp=?,
  ~email: input_StringComparisonExp=?,
  ~id: input_UuidComparisonExp=?,
  ~password: input_StringComparisonExp=?,
  ~updatedAt: input_TimestamptzComparisonExp=?,
  ~username: input_StringComparisonExp=?,
  unit,
) => input_UsersBoolExp = ""

@live @obj
external make_UsersInsertInput: (
  ~avatarUrl: string=?,
  ~bio: string=?,
  ~createdAt: RescriptRelay.any=?,
  ~email: string=?,
  ~id: RescriptRelay.any=?,
  ~password: string=?,
  ~updatedAt: RescriptRelay.any=?,
  ~username: string=?,
  unit,
) => input_UsersInsertInput = ""

@live @obj
external make_UsersOnConflict: (
  ~_constraint: [#users_email_key | #users_pkey | #users_username_key],
  ~updateColumns: array<[#avatarUrl | #bio | #createdAt | #email | #id | #password | #updatedAt | #username]>,
  ~where: input_UsersBoolExp=?,
  unit,
) => input_UsersOnConflict = ""

@live @obj
external make_UsersOrderBy: (
  ~avatarUrl: [#ASC | #ASC_NULLS_FIRST | #ASC_NULLS_LAST | #DESC | #DESC_NULLS_FIRST | #DESC_NULLS_LAST]=?,
  ~bio: [#ASC | #ASC_NULLS_FIRST | #ASC_NULLS_LAST | #DESC | #DESC_NULLS_FIRST | #DESC_NULLS_LAST]=?,
  ~createdAt: [#ASC | #ASC_NULLS_FIRST | #ASC_NULLS_LAST | #DESC | #DESC_NULLS_FIRST | #DESC_NULLS_LAST]=?,
  ~email: [#ASC | #ASC_NULLS_FIRST | #ASC_NULLS_LAST | #DESC | #DESC_NULLS_FIRST | #DESC_NULLS_LAST]=?,
  ~id: [#ASC | #ASC_NULLS_FIRST | #ASC_NULLS_LAST | #DESC | #DESC_NULLS_FIRST | #DESC_NULLS_LAST]=?,
  ~password: [#ASC | #ASC_NULLS_FIRST | #ASC_NULLS_LAST | #DESC | #DESC_NULLS_FIRST | #DESC_NULLS_LAST]=?,
  ~updatedAt: [#ASC | #ASC_NULLS_FIRST | #ASC_NULLS_LAST | #DESC | #DESC_NULLS_FIRST | #DESC_NULLS_LAST]=?,
  ~username: [#ASC | #ASC_NULLS_FIRST | #ASC_NULLS_LAST | #DESC | #DESC_NULLS_FIRST | #DESC_NULLS_LAST]=?,
  unit,
) => input_UsersOrderBy = ""

@live @obj
external make_UsersPkColumnsInput: (
  ~id: RescriptRelay.any,
) => input_UsersPkColumnsInput = ""

@live @obj
external make_UsersSetInput: (
  ~avatarUrl: string=?,
  ~bio: string=?,
  ~createdAt: RescriptRelay.any=?,
  ~email: string=?,
  ~id: RescriptRelay.any=?,
  ~password: string=?,
  ~updatedAt: RescriptRelay.any=?,
  ~username: string=?,
  unit,
) => input_UsersSetInput = ""

@live @obj
external make_UsersUpdates: (
  ~_set: input_UsersSetInput=?,
  ~where: input_UsersBoolExp,
  unit,
) => input_UsersUpdates = ""

@live @obj
external make_UuidComparisonExp: (
  ~_eq: RescriptRelay.any=?,
  ~_gt: RescriptRelay.any=?,
  ~_gte: RescriptRelay.any=?,
  ~_in: array<RescriptRelay.any>=?,
  ~_isNull: bool=?,
  ~_lt: RescriptRelay.any=?,
  ~_lte: RescriptRelay.any=?,
  ~_neq: RescriptRelay.any=?,
  ~_nin: array<RescriptRelay.any>=?,
  unit,
) => input_UuidComparisonExp = ""

