#import "/src/lib.typ": manual

#show: manual.with(
  title: "Package Name",
  description: "Short description, no longer than two lines.",
  authors: "Author",
  package: "npm/pkg-name@0.4.2",
  license: "MIT",
  from-comments: read("assets/file.js"),
  use-defaults: true,
)