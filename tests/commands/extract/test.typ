#import "/src/lib.typ": extract
#set page(width: auto, height: auto)
#set grid.cell(stroke: 1pt + black, inset: 5pt)
#state("min-manual-configuration-storage").update((comment-delim: ("///", "/**", "**/")))
#let showcase = ()

#showcase.push(
  extract(
    "feature",
    from: read("assets/file.typ"),
  )
)
#showcase.push(
  extract(
    "feature",
    rule: "call",
    from: read("assets/file.typ"),
  )
)
#showcase.push(
  extract(
    "feature",
    rule: "show",
    from: read("assets/file.typ"),
  )
)
#showcase.push(
  extract(
    "feature",
    rule: "show.with",
    from: read("assets/file.typ"),
  )
)
#showcase.push(
  extract(
    "feature",
    rule: "set",
    from: read("assets/file.typ"),
  )
)
#showcase.push(
  extract(
    "var",
    rule: "let",
    from: read("assets/file.typ"),
  )
)
#showcase.push(
  extract(
    "title",
    rule: "arg",
    from: read("assets/file.typ"),
  )
)
// Extract code from a example JavaScript file
#showcase.push(
  extract(
    "feature",
    from: read("assets/file.js"),
    lang: "js",
    model: "(?s)\s*<name>\((.*?)\) \{",
    display: "Class.<name> (<capt>)",
  )
)

#grid(
  columns: 2,
  gutter: 5pt,
  ..showcase
)


/// :feature: js "<name>(\(.*?\)) {" => Class.<name> (<capt>)
// #extract(
//   from: read("assets/file.typ"),
//   rule: none,
//   lang: "typ",
//   model: auto,
//   display: none,
//   name,
// )