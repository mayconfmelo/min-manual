#import "/src/lib.typ": extract
#set page(width: auto, height: auto)
#set grid.cell(stroke: 1pt + black, inset: 5pt)
#state("min-manual-configuration-storage").update((comment-delim: ("///", "/**", "**/")))
#let showcase = ()

#showcase.push(
  align(center)[call] +
  extract(
    "feature",
    from: read("assets/file.typ"), // from an example Typst file
  )
)
#showcase.push(
  align(center)[call] +
  extract(
    "feature",
    rule: "call",
  )
)
#showcase.push(
  align(center)[show] +
  extract(
    "feature",
    rule: "show",
  )
)
#showcase.push(
  align(center)[show.with] +
  extract(
    "feature",
    rule: "show.with",
  )
)
#showcase.push(
  align(center)[set] +
  extract(
    "feature",
    rule: "set",
  )
)
#showcase.push(
  align(center)[str] +
  extract(
    "feature",
    rule: "str",
  )
)
#showcase.push(
  align(center)[let] +
  extract(
    "var",
    rule: "let",
  )
)
#showcase.push(
  align(center)[arg] +
  extract(
    "title",
    rule: "arg",
  )
)
#showcase.push(
  align(center)[JavaScript] +
  extract(
    "feature",
    from: read("assets/file.js"), // from an example JavaScript file
    lang: "js",
    model: "(?s)\s*<name>\((.*?)\) \{",
    display: "let feat = Class.<name>(<capt>)",
  )
)

#grid(
  columns: 2,
  gutter: 5pt,
  ..showcase
)