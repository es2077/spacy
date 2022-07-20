type props = {
  label: Storybook.argTypes<string>,
  size: Storybook.argTypes<Button.size>,
}

let default = Storybook.make(
  ~title="Components/Button",
  ~component=Button.make,
  ~argTypes={
    label: Storybook.argType(~defaultValue="Click here", ~control=Text, ()),
    size: Storybook.argType(~defaultValue=#sm, ~options=[#sm, #md], ~control=Radio, ()),
  },
  (),
)
