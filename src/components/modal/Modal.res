module Styles = {
  open Emotion

  let overlayFadeIn = keyframes({
    "from": {
      "opacity": 0,
    },
    "to": {
      "opacity": 1,
    },
  })

  let contentFadeIn = keyframes({
    "from": {
      "opacity": 0,
      "transform": "translate(-50%, -48%) scale(.96)",
    },
    "to": {
      "opacity": 1,
      "transform": "translate(-50%, -50%) scale(1)",
    },
  })

  let overlay = css({
    "position": "fixed",
    "top": 0,
    "left": 0,
    "width": "100%",
    "height": "100%",
    "zIndex": Theme.zIndex(#above),
    "background": Theme.colors(#primary700)->Polished.transparentize(0.4, _),
    "animation": `${overlayFadeIn} 200ms cubic-bezier(0.16, 1, 0.3, 1)`,
  })

  let content = css({
    "position": "fixed",
    "top": "50%",
    "left": "50%",
    "transform": "translate(-50%, -50%)",
    "zIndex": Theme.zIndex(#above),
    "background": Theme.colors(#primary100),
    "borderRadius": Theme.radius(0.5),
    "animation": `${contentFadeIn} 200ms cubic-bezier(0.16, 1, 0.3, 1)`,
  })

  let close = css({
    "position": "absolute",
    "right": 16,
    "top": 16,
    "border": 0,
    "outline": 0,
    "display": "flex",
    "alignItems": "center",
    "justifyContent": "center",
    "background": "transparent",
    "padding": 8,
    "cursor": "pointer",
    "borderRadius": "50%",
    "transition": "200ms background",
    "&:focus": {
      "boxShadow": `0px 0px 0px 2px #858585`,
    },
    "&:hover": {
      "background": Theme.colors(#primary200)->Polished.transparentize(0.8, _),
    },
  })
}

module CloseIcon = {
  @react.component
  let make = () => {
    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" viewBox="0 0 20 20">
      <path
        fill="#000"
        d="M9.805 10.775l-4.85 4.85a.665.665 0 01-.485.208.665.665 0 01-.485-.208.665.665 0 01-.208-.485c0-.184.07-.346.208-.485l4.85-4.85-4.85-4.85a.665.665 0 01-.208-.484c0-.185.07-.347.208-.485a.665.665 0 01.485-.208c.185 0 .347.069.485.208l4.85 4.85 4.85-4.85a.665.665 0 01.485-.208c.185 0 .347.069.485.208.139.138.208.3.208.485 0 .184-.07.346-.208.485l-4.85 4.85 4.85 4.85a.665.665 0 010 .97.665.665 0 01-.485.207.665.665 0 01-.485-.208l-4.85-4.85z"
      />
    </svg>
  }
}

module Close = {
  @react.component
  let make = () => {
    <Radix.Dialog.Close asChild=true>
      <button className=Styles.close>
        <CloseIcon />
      </button>
    </Radix.Dialog.Close>
  }
}

module Root = Radix.Dialog.Root
module Trigger = Radix.Dialog.Trigger

module Overlay = {
  @react.component
  let make = () => {
    <Radix.Dialog.Overlay className=Styles.overlay />
  }
}

module Content = {
  @react.component
  let make = (~children) => {
    <Radix.Dialog.Content className=Styles.content> children </Radix.Dialog.Content>
  }
}
