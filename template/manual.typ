#import "@preview/min-manual:0.1.0": manual, arg, univ, pip, crate, pkg, extract

#show: manual.with(
  title: "Package Name",
  description: "Short description, no longer than two lines.",
  authors: "Author <@author>",
  cmd: "pkg-name",
  version: "0.4.2",
  license: "MIT",
  logo: image("assets/logo.png")
)


= Quick Start

```typm
// Minimal initialization example, like:
#import "@preview/pkg-name:0.4.2": feature
#show: feature.with(
  name: "Do Something",
  when: datetime.today(),
)
```


= Description

This example mimics a Typst package manual, but _min-manual_ is made to
universally document anything, not just Typst packages. This one is a standalone
file, to get manuals from doc-comments check out the `doc-comments.typ` example
manual.

#lorem(100)

#pagebreak()


= Options

Those are the full list of options available and its default values:

#extract(
  name: "feature",
  rule: "show",
  read("assets/module.typ")
)

Seems like an awful lot to start with, but let's just break down all this to
understand it better, shall we?

#arg(
  "name:", ("string", "content"),
  required: true
)[
  Explanation of what is this argument, what it does, and how to set it.
]

#arg(
  "text:", ("string", "content")
)[
  Explanation of what is this argument, what it does, and how to set it.
]

#arg(
  "when:", "datetime",
  required: true
)[
  Explanation of what is this argument, what it does, and how to set it.
]

#arg(
  "notify:", "boolean"
)[
  Explanation of what is this argument, what it does, and how to set it.
]


= Dependencies

Requires the #univ("example") Typst package. To set it up you will need the
#pip("fictional") Python module, or the #crate("nonexistent") crate. If this
package does not work, just go back to LaTeX and use
#pkg("alternative", "https://ctan.org/pkg/") instead, or delve into Regex and
one-liners with the #pkg("OG::Solution", "https://metacpan.org/pod/") Perl module.

#pagebreak()


= Copyright

Copyright #sym.copyright #datetime.today().year() MANUAL AUTHOR. \
This manual is licensed under MIT. \
The manual source code is free software:
you are free to change and redistribute it.  There is NO WARRANTY, to the extent
permitted by law.

The logo was obtained from #link("https://flaticon.com")[Flaticon] website.