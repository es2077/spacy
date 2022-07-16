open AncestorSpacy

let default = () => {
  <Box p=[xs(4.0)] bgColor=[xs(#hex("#000"))]>
    <Typography color=[xs("#fafafa"->#hex)] fontSize=[xs(24->#px)]>
      {`Styling with Ancestor`->React.string}
    </Typography>
  </Box>
}
