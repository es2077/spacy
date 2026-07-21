// A media player's UI from booleans. Nothing stops isPlaying AND isPaused
// being true at the same time — a state that makes no sense.
@react.component
let make = (~isPlaying: bool, ~isPaused: bool, ~atEnd: bool) =>
  if atEnd {
    <p> {"Ended"->React.string} </p>
  } else if isPlaying {
    <p> {"Playing"->React.string} </p>
  } else if isPaused {
    <p> {"Paused"->React.string} </p>
  } else {
    <p> {"Idle"->React.string} </p>
  }
