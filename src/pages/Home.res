open AncestorSpacy

module FormFields = %lenses(
  type state = {
    name: string,
    email: string,
    password: string,
  }
)

module MyForm = ReForm.Make(FormFields)

let default = () => {
  let _form = MyForm.use(~initialState={name: "", email: "", password: ""}, ())

  <Box p=[xs(4.0)] bgColor=[xs(#primary700)]>
    <Typography color=[xs(#primary100)] fontSize=[xs(24->#px)]>
      {`Styling with Ancestor`->React.string}
    </Typography>
  </Box>
}
