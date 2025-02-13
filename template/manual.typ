#import "@preview/min-manual:0.1.0": manual, arg, univ, pip, crate, pkg

#show: manual.with(
  title: "CMD FULL NAME",
  description: "Short description, no longer than two lines.",
  authors: "CMD AUTHOR <mailto:author@email.com>",
  cmd: "cmd-name",
  version: "0.4.2",
  license: "MIT",
  logo: image("assets/logo.png")
)


= Quick Start

```typm
// Minimal initialization example, like:
#import "@preview/cmd-name:0.1.0": cmd
#show: cmd.with(
  name,
  author
)
```


= Description

#lorem(100)

#lorem(45)

#pagebreak()


= Options

Those are the full list of options available and its default values:

```typm
#import "@preview/cmd-name:0.1.0": cmd
#show: cmd.with(
  name: none,
  author: none,
  version: none,
  date: datetime.today()
)
```

Seems like an awfull lot to start with, but let's just break down all this to
understand it better, shall we?

#arg(
  "name:", ("string", "content"),
  required: true
)[
  Explanation of what is this argument, what it does, and how to set it.
]

#arg(
  "author:", ("string", "content"),
  required: true
)[
  Explanation of what is this argument, what it does, and how to set it.
]

#arg(
  "version:", "string",
  required: true
)[
  Explanation of what is this argument, what it does, and how to set it.
]

#arg(
  "date:", "datetime"
)[
  Explanation of what is this argument, what it does, and how to set it.
]


= Libraries citation

The _cmd-name_ package requires the #univ("example") Typst package. To set it up
you will need the #pip("fictional") Python module, or the #crate("innexistent")
crate. If this package does not work, just go back to LaTeX and use
#pkg("alternative", "https://ctan.org/pkg/") instead, or delve into RegEx and
oneliners with the #pkg("OG::Solution", "https://metacpan.org/pod/") Perl module.


= Disclaimer

This example mimics a Typst package manual, but _min-manual_ is made to
universally document anything, not just Typst packages.


= Copyright

Copyright #sym.copyright #datetime.today().year() MANUAL AUTHOR. \
This manual is licensed under LICENCE. \
The manual source code is free software:
you are free to change and redistribute it.  There is NO WARRANTY, to the extent
permitted by law.

The logo was obtained from #link("https://flaticon.com")[Flaticon] website.