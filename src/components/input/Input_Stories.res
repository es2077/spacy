type props = {
  placeholder: Storybook.argTypes<string>,
  type_: Storybook.argTypes<string>,
  disabled: Storybook.argTypes<bool>,
  error: Storybook.argTypes<string>,
}

let default = Storybook.make(
  ~title="Components/Input",
  ~component=Input.make,
  ~argTypes={
    placeholder: Storybook.argType(~control=Text, ()),
    type_: Storybook.argType(
      ~control=Radio,
      ~options=["text", "password"],
      ~defaultValue="text",
      (),
    ),
    disabled: Storybook.argType(~control=Boolean, ()),
    error: Storybook.argType(~control=Text, ()),
  },
  (),
)
