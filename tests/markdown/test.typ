#import "/src/lib.typ": manual

#show: manual.with(
  title: "Package Name",
  description: "Short description, no longer than two lines.",
  authors: "Author",
  package: "pkg-name",
  license: "MIT",
  from-markdown: read("assets/file.md"),
  use-defaults: true,
)