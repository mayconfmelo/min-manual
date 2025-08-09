#import "/src/lib.typ": manual

#show: manual.with(
  title: "Package Name",
  description: "Short description, no longer than two lines.",
  authors: "Author <@author>",
  package: "pkg:typst/universe/pkg-name@0.4.2",
  license: "MIT",
  from-comments: read("assets/lib.typ")
)