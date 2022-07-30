type props = {
  size: Storybook.argTypes<ProfileName.size>,
  name: Storybook.argTypes<string>,
}

let default = Storybook.make(
  ~title="Components/ProfileName",
  ~component=ProfileName.make,
  ~argTypes={
    size: Storybook.argType(~control=Radio, ~options=[#lg, #md], ~defaultValue=#lg, ()),
    name: Storybook.argType(~control=Text, ~defaultValue=`Jeff Jarvis`, ()),
  },
  (),
)
