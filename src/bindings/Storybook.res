module Control = {
  type t

  type _control =
    | Radio
    | Select
    | Text
    | Boolean
    | Number({min: float, max: float, step: option<float>})
    | Range({min: float, max: float, step: option<float>})

  let identity: _control => t = control =>
    switch control {
    | Radio => {"type": "radio"}->Obj.magic
    | Select => {"type": "select"}->Obj.magic
    | Text => {"type": "text"}->Obj.magic
    | Boolean => {"type": "boolean"}->Obj.magic
    | Range({min, max, step}) => {"type": "range", "min": min, "max": max, "step": step}->Obj.magic
    | Number({min, max, step}) =>
      {"type": "Number", "min": min, "max": max, "step": step}->Obj.magic
    }
}

type argTypes<'value> = {
  options: option<array<'value>>,
  defaultValue: option<'value>,
  control: Control.t,
}

type story<'props, 'args> = {
  title: string,
  component: 'props => React.element,
  argTypes: option<'args>,
}

let argType = (~options=?, ~control, ~defaultValue=?, ()) => {
  options: options,
  control: control->Control.identity,
  defaultValue: defaultValue,
}

@module("./storybook-helpers.js")
external addArgTypes: ('props => React.element, 'args) => unit = "withArgTypes"

let make = (~title, ~component, ~argTypes=?, ()) => {
  title: title,
  component: component,
  argTypes: argTypes,
}
