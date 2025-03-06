#import "@preview/min-manual:0.0.1": manual, arg, univ, pip, crate, pkg, extract

#show: manual.with(
  title: "Package Name",
  description: "Short description, no longer than two lines.",
  authors: "Author <@author>",
  package: "pkg-name:0.4.2",
  license: "MIT",
  logo: image("assets/logo.png")
)


= Quick Start

```typm
// Minimal usage/initialization example, like:
#import "@preview/pkg-name:0.4.2": feature
#show: feature.with(
  name: "Do Something",
  when: datetime.today(),
)
```


= Description

This example mimics a Typst package manual, but _min-manual_ is made to
universally document anything, not just Typst packages.

There is two possible manual generation approaches, that rely on the following
basic structures to work, respectively:

#box(width: 1fr, baseline: -1em)[
```
template/
├── assets
│   └── logo.png
└── manual.typ
```
]
#box(width: 1fr)[
```
template/
├── assets
│   ├── logo.png
│   └── module.typ
└── doc-comments.typ
```
]

The left one /*top one here on code*/ is this manual, generated by a standalone
`manual.typ` file maitained separatedlly from the code; while the right one
/*bottom one here on code*/ is a manual generated by `doc-comments.typ`, which in
turn collects and parsers doc-comments in `assets/module.typ` file.

#pagebreak()


= Options

Those are the full list of options available and its default values:


// Extracts tue feature function from assets/module.typ
#extract(
  name: "feature",
  rule: "show",
  read("assets/module.typ")
)

Let's just break down all this code to understand it better, shall we?

#arg("```typm #show: feature.with()``` -> content")[
  Explanation of what is this structure, what it does, and how to properly set it.
]

#arg("```typm #set feature()``` -> nothing")[
  Explanation of what is this structure, what it does, and how to properly set it.
]

#arg("```typm #feature()``` -> content")[
  Explanation of what is this structure, what it does, and how to properly set it.
]

#arg("name: <- string | content <required>")[
  Explanation of what is this argument, what it does, and how to properly set it.
]

#arg("text: <- string | content")[
  Explanation of what is this argument, what it does, and how to properly set it.
]

#arg("when: <- datetime <required>")[
  Explanation of what is this argument, what it does, and how to properly set it.
]

#arg("notify: <- boolean")[
  Explanation of what is this argument, what it does, and how to properly set it.
]

#arg("body <- content | string")[
  Explanation of what is this argument, what it does, and how to properly set it.
]


= Dependencies

Requires the #univ("example") Typst package. To setup the project you will need
the #pip("fictional") Python module, or the #crate("nonexistent") crate. If this
package does not work, just go back to LaTeX and use
#pkg("alternative", "https://ctan.org/pkg/") instead, or delve into Regex and
one-liners with the #pkg("OG::Solution", "https://metacpan.org/pod/") Perl module.



= Copyright

Copyright #sym.copyright #datetime.today().year() MANUAL AUTHOR. \
This manual is licensed under MIT. \
The manual source code is free software:
you are free to change and redistribute it.  There is NO WARRANTY, to the extent
permitted by law.

The logo was obtained from #link("https://flaticon.com")[Flaticon] website.