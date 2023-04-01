open AncestorSpacy
open Render

module Hero = Home_Hero

let default = () => {
  let fakeArticles = [1, 2, 3, 4, 5, 6]
  <Box p=[xs(4.0)]>
    <Hero>
      <Hero.Title />
      <Box maxW=[xs(508->#px)] width=[xs(100.0->#pct)]>
        <Hero.Text />
      </Box>
      <Box maxW=[xs(178->#px)] width=[xs(100.0->#pct)]>
        <Modal.Root>
          <Modal.Trigger asChild=true>
            <Button block=true label={`Create account`} />
          </Modal.Trigger>
          <Modal.Overlay />
          <SignUpModal />
        </Modal.Root>
      </Box>
    </Hero>
    <Stack gap=[xs(#one(8.0))] mt=[xs(14.0)] alignItems=[xs(#center)]>
      <Grid spacing=[xs(4.0)]>
        {fakeArticles->map((_, key) => {
          <Box columns=[xs(#6)] key>
            <ArticleCard
              title={`Toward a Journalistic Ethic of Citation`}
              description={`After The New York Times published its extensive report on the history of Haiti’s impoverishment at the hands.`}
              authorName={`Jeff Jarvis`}
              readingTime=3
              published={`May 26, 2022`}
            />
          </Box>
        })}
      </Grid>
      <Button label="Load more" />
    </Stack>
  </Box>
}
