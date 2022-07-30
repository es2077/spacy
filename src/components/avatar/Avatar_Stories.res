type props = {
  name: Storybook.argTypes<string>,
  size: Storybook.argTypes<float>,
}

let default = Storybook.make(
  ~title="Components/Avatar",
  ~component=Avatar.make,
  ~argTypes={
    name: Storybook.argType(~control=Text, ~defaultValue="Jeff Jarvis", ()),
    size: Storybook.argType(
      ~control=Range({min: 1.0, max: 10.0, step: None}),
      ~defaultValue=1.0,
      (),
    ),
  },
  (),
)
