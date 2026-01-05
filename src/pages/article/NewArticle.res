// Aula
// Um recap do que já vimos até agora
// - Ver o design da pagina de criação
// - Criar os ReForm
// - Layout e estilização

open AncestorSpacy

module CreateArticleMutation = %relay(`
mutation NewArticleMutation($input: ArticlesInsertInput!) {
  insertArticlesOne(object: $input) {
    id
    slug
  }
}
`)

module Query = %relay(`
query NewArticleQuery {
  usersConnection(first: 1) {
    edges {
      node {
        id
      }
    }
  }
}
`)

module FormFields = %lenses(
  type state = {
    title: string,
    short: string,
    content: string,
  }
)

module Form = ReForm.Make(FormFields)

let formSchema = {
  open Form.Validation

  schema([
    nonEmpty(~error="Title is required", Title),
    nonEmpty(~error="Short is required", Short),
    nonEmpty(~error="Content is required", Content),
  ])
}

// Helper function to create a URL-friendly slug from a title
let createSlug = title => {
  title
  ->Js.String2.toLowerCase
  ->Js.String2.replaceByRe(%re("/[^a-z0-9]+/g"), "-")
  ->Js.String2.replaceByRe(%re("/^-+|-+$/g"), "")
}

let default = () => {
  let handleSubmit = (event: Form.onSubmitAPI) => {
    Js.log(event.state)

    None
  }
  let form = Form.use(
    ~initialState={title: "", content: "", short: ""},
    ~onSubmit=handleSubmit,
    ~validationStrategy=OnDemand,
    ~schema=formSchema,
    (),
  )

  let handleChange = fieldName => ReForm.Helpers.handleChange(form.handleChange(fieldName))

  let handleSubmitClick = e => {
    e->ReactEvent.Mouse.preventDefault
    form.submit()
  }

  <Stack py=[xs(12.)] width=[xs(#pct(70.))]>
    <Stack py=[xs(3.)]>
      <Typography
        fontSize=[xs(2.8->#rem)]
        fontWeight=[xs(#700)]
        letterSpacing=[xs(-0.02->#em)]
        color=[xs(#primary700)]>
        {"New article"->React.string}
      </Typography>
    </Stack>
    <Stack gap=[xs(#one(3.0))]>
      <Input
        placeholder="Title"
        autoFocus=true
        onChange={handleChange(Title)}
        value={form.values.title}
        error=?{form.getFieldError(Field(Title))}
      />
      <Input
        placeholder="What's this article about?"
        autoFocus=true
        onChange={handleChange(Short)}
        value={form.values.short}
        error=?{form.getFieldError(Field(Short))}
      />
      <Textarea
        placeholder="Write your article (in markdown)"
        onChange={handleChange(Content)}
        value={form.values.content}
        error=?{form.getFieldError(Field(Content))}
      />
      <Box display=[xs(#flex)] justifyContent=[xs(#"flex-end")]>
        <Button label="Publish article" onClick={handleSubmitClick} />
      </Box>
    </Stack>
  </Stack>
}
