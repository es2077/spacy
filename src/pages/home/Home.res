open AncestorSpacy

module Hero = Home_Hero

let default = () => {
  <Box p=[xs(4.0)]>
    <Hero>
      <Hero.Title />
      <Box maxW=[xs(508->#px)] width=[xs(100.0->#pct)]>
        <Hero.Text />
      </Box>
      <Box maxW=[xs(178->#px)] width=[xs(100.0->#pct)]>
        <Button block=true label={`Create account`} />
      </Box>
    </Hero>
  </Box>
}
