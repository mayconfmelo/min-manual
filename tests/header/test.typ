#import "/src/lib.typ": manual
#set page(height: auto)

#manual(
  title: "Package Name",
  description: "Short description, no longer than two lines.",
  authors: "Author",
  package: "rpm/fedora/pkg-name@0.4.2",
  license: "MIT",
  []
)
#manual(
  title: "Package Name",
  description: "Short description, no longer than two lines.",
  authors: "Author <https://example.com/author/>",
  package: "rpm/pkg-name@0.4.2",
  license: "MIT",
  []
)
#manual(
  title: "Package Name",
  description: "Short description, no longer than two lines.",
  authors: "Author <mailto:author@email.com>",
  package: "pkg-name:0.4.2",
  license: "MIT",
  []
)
#manual(
  title: "Package Name",
  description: "Short description, no longer than two lines.",
  authors: "Author <@author>",
  package: "pkg-name",
  license: "MIT",
  []
)