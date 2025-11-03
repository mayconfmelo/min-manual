#import "/src/lib.typ": manual

#show: manual.with(
  title: "Package Name",
  description: "Short description, no longer than two lines.",
  authors: "Author",
  package: "pkg:type/name@version",
  license: "MIT",
  from-comments: read("assets/file.js"),
  typst-defaults: true,
)