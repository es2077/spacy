open AncestorSpacy

module HeaderFragment = %relay(`
fragment HeaderFragment_user on Users {
  id
  username
}
`)

module WithUser = {
  @react.component
  let make = (~user) => {
    let user = HeaderFragment.use(user)
    let resetRelayEnvironment = RelayResetContext.useResetRelayEnvironment()

    let handleLogout = _ => {
      // Call logout API to clear the cookie
      Fetch.fetchWithInit(
        "/api/logout",
        Fetch.RequestInit.make(~method_=Post, ~credentials=Include, ()),
      )
      |> Js.Promise.then_(_ => {
        // After logout, reset the Relay environment to refetch without auth
        resetRelayEnvironment()
        Js.Promise.resolve()
      })
      |> Js.Promise.catch(_ => {
        // Even if logout API fails, reset the environment
        resetRelayEnvironment()
        Js.Promise.resolve()
      })
      |> ignore
    }

    <Stack
      width=[xs(100.0->#pct)]
      justifyContent=[xs(#"space-between")]
      direction=[xs(#horizontal)]
      tag=#header>
      <Logo />
      <Button label={`Logout`} onClick={handleLogout} />
    </Stack>
  }
}

module WithoutUser = {
  @react.component
  let make = () => {
    let (isSignInModalOpen, setIsSignInModalOpen) = React.useState(() => false)
    let setIsSignInModalOpen = value => setIsSignInModalOpen(_ => value)
    let closeSignInModal = () => setIsSignInModalOpen(false)

    <Stack
      width=[xs(100.0->#pct)]
      justifyContent=[xs(#"space-between")]
      direction=[xs(#horizontal)]
      tag=#header>
      <Logo />
      <Modal.Root _open=isSignInModalOpen onOpenChange=setIsSignInModalOpen>
        <Modal.Trigger asChild=true>
          <Button label={`Sign in`} />
        </Modal.Trigger>
        <Modal.Overlay />
        <SignInModal closeSignInModal />
      </Modal.Root>
    </Stack>
  }
}
