/* @generated */
@@ocaml.warning("-30")

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
type rec input_ArticlesFeedInput = {
  filter: option<input_ArticlesFeedFilterInput>,
}

@live
and input_ArticlesFeedInput_nullable = {
  filter?: Js.Null.t<input_ArticlesFeedFilterInput_nullable>,
}

@live
and input_ArticlesFeedFilterInput = {
  author: option<string>,
  tag: option<string>,
  favorited: option<string>,
  limit: option<float>,
  offset: option<float>,
}

@live
and input_ArticlesFeedFilterInput_nullable = {
  author?: Js.Null.t<string>,
  tag?: Js.Null.t<string>,
  favorited?: Js.Null.t<string>,
  limit?: Js.Null.t<float>,
  offset?: Js.Null.t<float>,
}

@live
and input_CreateArticleInput = {
  title: string,
  description: string,
  body: string,
  tagList: option<array<string>>,
}

@live
and input_CreateArticleInput_nullable = {
  title: string,
  description: string,
  body: string,
  tagList?: Js.Null.t<array<string>>,
}

@live
and input_UpdateArticleInput = {
  slug: string,
  title: option<string>,
  description: option<string>,
  body: option<string>,
}

@live
and input_UpdateArticleInput_nullable = {
  slug: string,
  title?: Js.Null.t<string>,
  description?: Js.Null.t<string>,
  body?: Js.Null.t<string>,
}

@live
and input_AddCommentToAnArticleInput = {
  body: string,
  articleSlug: string,
}

@live
and input_AddCommentToAnArticleInput_nullable = {
  body: string,
  articleSlug: string,
}

@live
and input_DeleteCommentInput = {
  articleSlug: string,
  id: string,
}

@live
and input_DeleteCommentInput_nullable = {
  articleSlug: string,
  id: string,
}

@live
and input_CreateUserInput = {
  username: string,
  email: string,
  password: string,
}

@live
and input_CreateUserInput_nullable = {
  username: string,
  email: string,
  password: string,
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
and input_UpdateUserInput = {
  email: option<string>,
  username: option<string>,
  bio: option<string>,
  password: option<string>,
  image: option<string>,
}

@live
and input_UpdateUserInput_nullable = {
  email?: Js.Null.t<string>,
  username?: Js.Null.t<string>,
  bio?: Js.Null.t<string>,
  password?: Js.Null.t<string>,
  image?: Js.Null.t<string>,
}
@live @obj
external make_ArticlesFeedInput: (
  ~filter: input_ArticlesFeedFilterInput=?,
  unit,
) => input_ArticlesFeedInput = ""

@live @obj
external make_ArticlesFeedFilterInput: (
  ~author: string=?,
  ~tag: string=?,
  ~favorited: string=?,
  ~limit: float=?,
  ~offset: float=?,
  unit,
) => input_ArticlesFeedFilterInput = ""

@live @obj
external make_CreateArticleInput: (
  ~title: string,
  ~description: string,
  ~body: string,
  ~tagList: array<string>=?,
  unit,
) => input_CreateArticleInput = ""

@live @obj
external make_UpdateArticleInput: (
  ~slug: string,
  ~title: string=?,
  ~description: string=?,
  ~body: string=?,
  unit,
) => input_UpdateArticleInput = ""

@live @obj
external make_AddCommentToAnArticleInput: (
  ~body: string,
  ~articleSlug: string,
) => input_AddCommentToAnArticleInput = ""

@live @obj
external make_DeleteCommentInput: (
  ~articleSlug: string,
  ~id: string,
) => input_DeleteCommentInput = ""

@live @obj
external make_CreateUserInput: (
  ~username: string,
  ~email: string,
  ~password: string,
) => input_CreateUserInput = ""

@live @obj
external make_LoginInput: (
  ~email: string,
  ~password: string,
) => input_LoginInput = ""

@live @obj
external make_UpdateUserInput: (
  ~email: string=?,
  ~username: string=?,
  ~bio: string=?,
  ~password: string=?,
  ~image: string=?,
  unit,
) => input_UpdateUserInput = ""

