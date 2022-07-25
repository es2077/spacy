type props = {
  label: Storybook.argTypes<string>,
  size: Storybook.argTypes<Button.size>,
  disabled: Storybook.argTypes<bool>,
  block: Storybook.argTypes<bool>,
  loading: Storybook.argTypes<bool>,
}

let default = Storybook.make(
  ~title="Components/Button",
  ~component=Button.make,
  ~argTypes={
    label: Storybook.argType(~defaultValue="Click here", ~control=Text, ()),
    size: Storybook.argType(~defaultValue=#md, ~options=[#md, #lg], ~control=Radio, ()),
    disabled: Storybook.argType(~defaultValue=false, ~control=Boolean, ()),
    block: Storybook.argType(~defaultValue=false, ~control=Boolean, ()),
    loading: Storybook.argType(~defaultValue=false, ~control=Boolean, ()),
  },
  (),
)
