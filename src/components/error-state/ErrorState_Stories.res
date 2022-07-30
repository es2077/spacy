type props = {
  title: Storybook.argTypes<string>,
  description: Storybook.argTypes<string>,
}

let default = Storybook.make(
  ~title="Components/ErrorState",
  ~component=ErrorState.make,
  ~argTypes={
    title: Storybook.argType(~control=Text, ~defaultValue=`Something went wrong.`, ()),
    description: Storybook.argType(
      ~control=Text,
      ~defaultValue=`This user hasn't written any articles yet.`,
      (),
    ),
  },
  (),
)

let withCta = props =>
  <ErrorState
    title={props["title"]}
    description={props["description"]}
    cta=("Try again", _ => Console.log("Trying..."))
  />
