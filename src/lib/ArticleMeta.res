// Shared article metadata helpers, used by the home list and the article page.

@send
external toLocaleDateString: (Js.Date.t, string, {..}) => string = "toLocaleDateString"

// Format an ISO timestamp (e.g. "2022-05-26T...") into "May 26, 2022".
let publishedAt = iso =>
  Js.Date.fromString(iso)->toLocaleDateString(
    "en-US",
    {"year": "numeric", "month": "short", "day": "numeric", "timeZone": "UTC"},
  )

// Estimate reading time in minutes from the article body (~200 words/min).
let readingTime = body => {
  let words = body->Js.String2.split(" ")->Belt.Array.length
  Js.Math.max_int(1, words / 200)
}

// Human-readable reading time, e.g. "3min".
let readingLabel = body => readingTime(body)->Belt.Int.toString ++ "min"
