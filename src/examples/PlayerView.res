// One value, one state — a player can't be playing AND paused at once.
type playback =
  | Idle
  | Playing(int)
  | Paused(int)
  | Ended
  | Buffering

@react.component
let make = (~playback: playback) =>
  switch playback {
  | Idle => <p> {"Idle"->React.string} </p>
  | Playing(_) => <p> {"Playing"->React.string} </p>
  | Paused(_) => <p> {"Paused"->React.string} </p>
  | Ended => <p> {"Ended"->React.string} </p>
  | Buffering => <p> {"Buffering…"->React.string} </p>
  }
