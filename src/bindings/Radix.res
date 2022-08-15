module Popover = {
  module Root = {
    @react.component @module("@radix-ui/react-popover")
    external make: (~children: React.element) => React.element = "Root"
  }

  module Trigger = {
    @react.component @module("@radix-ui/react-popover")
    external make: (~children: React.element, ~asChild: bool=?) => React.element = "Trigger"
  }

  module Portal = {
    @react.component @module("@radix-ui/react-popover")
    external make: (~children: React.element, ~forceMount: bool=?) => React.element = "Portal"
  }

  module Content = {
    @react.component @module("@radix-ui/react-popover")
    external make: (
      ~children: React.element,
      ~asChild: bool=?,
      ~forceMount: bool=?,
      ~side: [#top | #right | #bottom | #left]=?,
      ~sideOffset: int=?,
    ) => React.element = "Content"
  }
}
