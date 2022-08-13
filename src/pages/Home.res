open AncestorSpacy

let default = () => {
  <Box p=[xs(4.0)] bgColor=[xs(#primary700)]>
    <Typography color=[xs(#primary100)] fontSize=[xs(24->#px)]>
      {`Styling with Ancestor`->React.string}
    </Typography>
  </Box>
}
