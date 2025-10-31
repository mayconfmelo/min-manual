#import "/src/lib.typ": extract
#set page(width: auto, height: auto, margin: 1em)
#set par(spacing: 2em)

= Defaults

#extract(
  "function",
  from: read("assets/file.typ"),
)

== Display

#extract(
  "function",
  display: "call",
)

#extract(
  "function",
  display: "show"
)

#extract(
  "function",
  display: "show.with"
)

#extract(
  "function",
  display: "set"
)

#extract(
  "function",
  display: "str"
)

#extract(
  "function",
  display: "src"
)

#extract(
  "date",
  display: "arg",
)

#extract(
  "variable",
  display: "let",
)

== Model

#extract(
  "function",
  model: "func",
)

#extract(
  "calling",
  model: "call",
)

#extract(
  "variable",
  model: "let",
)

#extract(
  "date",
  model: "arg",
)
