open AncestorSpacy

let content = `<h2 id="batched-consistency">Batched Consistency</h2>
<p>Let&#39;s start with <a href="https://react.dev">React</a>. When you update state, it holds off committing those changes until the next render cycle. The benefit here is that React is always consistent. count and doubleCount and the DOM are always observed to be in sync.</p>
<p>Consistency in frameworks is important. It builds trust. You know when you interact with the view what you see is what you get. If the user sees something but the state of the app is different, that can lead to obscure bugs because user-driven actions can cause unexpected results while appearing intentional. Sometimes to serious consequences (financial or otherwise).</p>
<h2 id="so-">So...?</h2>
<p>So honestly, this all sucks. Enough that I feel the need to be aware of batching behavior. And with that awareness then I&#39;m compelled to offer a consistent default as it feels like the sanest thing to do.</p>
<h3 id="1-choosing-the-best-model">1. Choosing the Best Model</h3>
<p>This is the point of the article where I&#39;m supposed to say the right answer is &quot;it depends&quot; and leave you all with some profound thoughts. But that&#39;s not where I&#39;m at.</p>
<h3 id="2-natural-execution">2. Natural Execution</h3>
<p>In the company of the others, Svelte&#39;s execution might not seem that desirable. It isn&#39;t consistent. And does not attempt to appear to be. It also is sort of perfect for Svelte.</p>`

module Styles = {
  let container = Emotion.css({
    "h2": {
      "margin": 0,
      "marginBottom": Theme.spacing(3.0),
      "color": Theme.colors(#primary700),
      "fontSize": "3.2rem",
      "lineHeight": "3.2rem",
      "fontWeight": 700,
    },
    "h3": {
      "margin": 0,
      "marginBottom": Theme.spacing(1.5),
      "color": Theme.colors(#primary700),
      "fontSize": "2.4rem",
      "lineHeight": "2.8rem",
      "fontWeight": 700,
    },
    "a": {
      "color": Theme.colors(#primary700),
      "fontWeight": 500,
      "textDecoration": "underline",
      "fontSize": "1em",
    },
    "p": {
      "margin": 0,
      "marginBottom": Theme.spacing(2.0),
      "fontSize": "1.8rem",
      "lineHeight": "2.8rem",
      "color": Theme.colors(#primary300),
    },
  })
}

let default = () => {
  <Stack pt=[xs(14.0)] maxW=[xs(784->#px)] width=[xs(100.0->#pct)] gap=[xs(#one(2.0))]>
    <Stack
      direction=[xs(#horizontal)]
      alignItems=[xs(#center)]
      gap=[xs(#one(1.5))]
      divider={<Base tag=#span fontSize=[xs(2.0->#rem)] color=[xs(#primary200)]>
        {"//"->React.string}
      </Base>}>
      <ProfileName name="Jeff Jarvis" />
      <Typography tag=#span fontSize=[xs(16->#px)] fontWeight=[xs(#700)] color=[xs(#primary700)]>
        {"3min"->React.string}
      </Typography>
      <Typography tag=#span fontSize=[xs(16->#px)] fontWeight=[xs(#700)] color=[xs(#primary700)]>
        {"Mar 23, 2022"->React.string}
      </Typography>
    </Stack>
    <Stack gap=[xs(#one(2.0))] mb=[xs(6.0)]>
      <Typography
        m=[xs(0.0)]
        tag=#h1
        fontSize=[xs(3.6->#rem)]
        letterSpacing=[xs(-0.04->#em)]
        lineHeight=[xs(4.6->#rem)]
        color=[xs(#primary700)]>
        {"The Cost of Consistency in UI Frameworks"->React.string}
      </Typography>
      <Typography
        m=[xs(0.0)]
        tag=#p
        color=[xs(#primary300)]
        fontSize=[xs(1.8->#rem)]
        lineHeight=[xs(2.8->#rem)]>
        {"Sometimes there are problems that have no universally good solutions. There is some tradeoff to be made. Some perspectives that can't be protected. Sometimes it isn't even clear if any of the options are preferable to the others."->React.string}
      </Typography>
    </Stack>
    <Box className=Styles.container dangerouslySetInnerHTML={{"__html": content}} />
  </Stack>
}
