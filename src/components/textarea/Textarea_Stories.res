type props = {
  placeholder: Storybook.argTypes<string>,
  disabled: Storybook.argTypes<bool>,
  error: Storybook.argTypes<string>,
}

let default = Storybook.make(
  ~title="Components/Textarea",
  ~component=Textarea.make,
  ~argTypes={
    placeholder: Storybook.argType(~control=Text, ()),
    disabled: Storybook.argType(~control=Boolean, ()),
    error: Storybook.argType(~control=Text, ()),
  },
  (),
)
