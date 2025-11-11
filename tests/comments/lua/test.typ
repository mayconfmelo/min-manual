#import "/src/lib.typ": manual

#show: manual.with(
  title: "Package Name",
  description: "Short description.",
  authors: "Author",
  package: "pkg:type/name@version",
  license: "MIT",
  from-comments: read("assets/file.lua"),
  comment-delim: ("---", "--[[-", "-]]--"),
  typst-defaults: true,
)