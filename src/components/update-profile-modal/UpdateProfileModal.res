open AncestorSpacy

// The current logged-in user, used to pre-fill the form.
module Query = %relay(`
query UpdateProfileModalQuery {
  usersConnection(first: 1) {
    edges {
      node {
        id
        username
        bio
        email
      }
    }
  }
}
`)

// where: {} matches every row, but Hasura's update permission scopes it to the
// session user (filter X-Hasura-User-Email) — so this only ever updates "me".
module UpdateProfileMutation = %relay(`
mutation UpdateProfileModalMutation($set: UsersSetInput!) {
  updateUsers(where: {}, _set: $set) {
    affectedRows
    returning {
      id
      username
      bio
    }
  }
}
`)

// Password isn't edited here — changing it needs the hashing API, not a direct
// column update — so the profile form only covers username, email and bio.
module FormFields = %lenses(
  type state = {
    username: string,
    email: string,
    bio: string,
  }
)

module Form = ReForm.Make(FormFields)

let formSchema = {
  open Form.Validation

  schema([
    nonEmpty(~error="Username is required", Username),
    nonEmpty(~error="Bio is required", Bio),
    email(~error="Invalid email", Email),
  ])
}

// Inner form, mounted only once the user is loaded — ReForm reads initialState
// on the first render only, so the values must be present when it mounts.
module Content = {
  @react.component
  let make = (~username, ~email, ~bio) => {
    let (mutate, _) = UpdateProfileMutation.use()

    let handleSubmit = (event: Form.onSubmitAPI) => {
      // Password is left out — it must be hashed through the API, not set here.
      mutate(
        ~variables={
          set: {
            username: Some(event.state.values.username),
            bio: Some(event.state.values.bio),
            email: Some(event.state.values.email),
            // Left unchanged — password must be hashed via the API, not set here.
            password: None,
            avatarUrl: None,
            id: None,
            createdAt: None,
            updatedAt: None,
          },
        },
        ~onCompleted=(_response, _errors) => (),
        (),
      )->RescriptRelay.Disposable.ignore

      None
    }
    let form = Form.use(
      ~initialState={username, email, bio},
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
          {"Update your profile"->React.string}
        </Typography>
        <Stack gap=[xs(#one(3.0))]>
          <Input
            placeholder="Username"
            autoFocus=true
            onChange={handleChange(Username)}
            value={form.values.username}
            error=?{form.getFieldError(Field(Username))}
          />
          <Textarea
            placeholder="Share a bio about you"
            onChange={handleChange(Bio)}
            value={form.values.bio}
            error=?{form.getFieldError(Field(Bio))}
          />
          <Input
            placeholder="Email"
            onChange={handleChange(Email)}
            value={form.values.email}
            error=?{form.getFieldError(Field(Email))}
          />
          <Button label="Submit" onClick={handleSubmitClick} />
        </Stack>
      </Stack>
    </Modal.Content>
  }
}

@react.component
let make = () => {
  let queryData = Query.use(~variables=(), ())

  switch queryData.usersConnection.edges->Belt.Array.get(0) {
  | None => React.null
  | Some({node: user}) => <Content username={user.username} email={user.email} bio={user.bio} />
  }
}
