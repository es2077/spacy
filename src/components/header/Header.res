open AncestorSpacy

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
