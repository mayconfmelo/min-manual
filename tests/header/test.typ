#import "/src/lib.typ": manual
#import "/src/utils.typ": purl
#set page(height: auto, header: none)

#assert.eq(purl("name"),                             ("typst", "name", none))
#assert.eq(purl("name:0.0.0"),                       ("typst", "name", "0.0.0"))
#assert.eq(purl("@namespace/name:0.0.0"),            ("typst", "namespace/name", "0.0.0"))
#assert.eq(purl("pkg:type/name@version"),            ("type", "name", "version"))
#assert.eq(purl("pkg:type/namespace/name@version"),  ("type", "namespace/name", "version"))

#manual(
  title: "Package Name",
  description: "Short description, no longer than two lines.",
  authors: ("Main Author <@author>", "Colaborator <@collaborator>"),
  package: "name",
  license: "MIT",
  typst-defaults: true,
  []
)
#manual(
  title: "Package Name",
  description: "Short description, no longer than two lines.",
  authors: "Author <author@email.com>",
  package: "name:0.0.0",
  license: "MIT",
  typst-defaults: true,
  []
)
#manual(
  title: "Package Name",
  description: "Short description, no longer than two lines.",
  authors: "Author <https://example.com/author/>",
  package: "pkg:type/name@0.0.0-beta",
  license: "MIT",
  typst-defaults: true,
  []
)
#manual(
  title: "Package Name",
  description: "Short description, no longer than two lines.",
  authors: "Author",
  package: "pkg:type/namespace/name@000000-0",
  license: "MIT",
  typst-defaults: true,
  []
)
