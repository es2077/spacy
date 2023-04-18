open AncestorSpacy
open Render

let name = "Jeff Jarvis"

let default = () =>
  <Box mt=[xs(14.0)] display=[xs(#flex)] justifyContent=[xs(#center)] width=[xs(100.0->#pct)]>
    <Box maxW=[xs(992->#px)] width=[xs(100.0->#pct)] position=[xs(#relative)]>
      <Stack
        direction=[xs(#horizontal)]
        alignItems=[xs(#center)]
        gap=[xs(#one(3.0))]
        right=[xs(#zero)]
        top=[xs(80->#px)]
        position=[xs(#absolute)]>
        <Button label="New article" />
        <Typography fontSize=[xs(1.6->#rem)]> {"Edit profile"->s} </Typography>
      </Stack>
      <Stack alignItems=[xs(#center)]>
        <Avatar name size=2.5 />
        <Typography
          m=[xs(0.0)]
          mt=[xs(3.0)]
          textAlign=[xs(#center)]
          fontSize=[xs(1.8->#rem)]
          color=[xs(#primary300)]
          fontWeight=[xs(#700)]
          letterSpacing=[xs(-0.02->#em)]
          tag=#span>
          {"@jeffjarvis"->s}
        </Typography>
        <Typography
          m=[xs(0.0)]
          mt=[xs(1.0)]
          textAlign=[xs(#center)]
          fontSize=[xs(2.8->#rem)]
          color=[xs(#primary700)]
          fontWeight=[xs(#700)]
          tag=#h1>
          {name->s}
        </Typography>
        <Typography
          tag=#p
          maxW=[xs(452->#px)]
          m=[xs(0.0)]
          mt=[xs(2.0)]
          textAlign=[xs(#center)]
          fontSize=[xs(1.8->#rem)]
          color=[xs(#primary300)]
          lineHeight=[xs(2.8->#rem)]
          fontWeight=[xs(#400)]>
          {"Frontend performance enthusiast and Fine-Grained Reactivity super fan. Author of the SolidJS UI library and MarkoJS Core Team Memberr"->s}
        </Typography>
      </Stack>
    </Box>
  </Box>
