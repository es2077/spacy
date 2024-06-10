open AncestorSpacy

module SignUpMutation = %relay(`
mutation SignUpModalMutation($input: SignUpInput!) {
  signUp(input: $input) {
    token
    error
  }
}
`)

module FormFields = %lenses(
  type state = {
    username: string,
    email: string,
    password: string,
  }
)

module Form = ReForm.Make(FormFields)

let formSchema = {
  open Form.Validation

  schema([
    nonEmpty(~error="Username is required", Username),
    email(~error="Invalid email", Email),
    string(~min=8, Password),
  ])
}

@react.component
let make = (~closeSignUpModal) => {
  let (signUpMutate, isMutating) = SignUpMutation.use()
  let handleSubmit = (event: Form.onSubmitAPI) => {
    signUpMutate(
      ~onCompleted=(response, _mutationErrors) => {
        Js.log(response)
        closeSignUpModal()
        ()
      },
      ~variables={
        input: {
          username: event.state.values.username,
          email: event.state.values.email,
          password: event.state.values.password,
          bio: "",
        },
      },
      (),
    )->RescriptRelay.Disposable.ignore

    None
  }

  let form = Form.use(
    ~initialState={username: "", email: "", password: ""},
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

  <Modal.Content>
    <Modal.Close />
    <Stack gap=[xs(#one(4.0))] minW=[xs(370->#px)] py=[xs(5.0)] px=[xs(4.0)]>
      <Typography
        fontSize=[xs(2.8->#rem)]
        fontWeight=[xs(#700)]
        letterSpacing=[xs(-0.02->#em)]
        color=[xs(#primary700)]>
        {"Sign up"->React.string}
      </Typography>
      <Stack gap=[xs(#one(3.0))]>
        <Input
          placeholder="Username"
          autoFocus=true
          onChange={handleChange(Username)}
          value={form.values.username}
          error=?{form.getFieldError(Field(Username))}
        />
        <Input
          placeholder="Email"
          onChange={handleChange(Email)}
          value={form.values.email}
          error=?{form.getFieldError(Field(Email))}
        />
        <Input
          type_="password"
          placeholder="Password"
          onChange={handleChange(Password)}
          value={form.values.password}
          error=?{form.getFieldError(Field(Password))}
        />
        <Button disabled={isMutating} label="Sign up" onClick={handleSubmitClick} />
      </Stack>
    </Stack>
  </Modal.Content>
}
