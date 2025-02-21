#import "@preview/min-manual:0.1.0": manual, arg

#show: manual.with(
  title: "Minimal Manuals",
  description: "Simple and sober manuals inspired by the OG Linux manpages.",
  authors: "Maycon F. Melo <https://github.com/mayconfmelo>",
  cmd: "min-manual",
  version: "0.1.0",
  license: "MIT",
  logo: image("assets/manual-logo.png") 
)

= Quick Start

```typm
#import "@preview/min-manual:0.1.0": manual
#show: manual.with(
  title: "Package Name",
  description: "Short description, no longer than two lines.",
  authors: "Author <mailto:author@email.com>",
  cmd: "pkg-name",
  version: "0.4.2",
  license: "MIT",
  logo: image("assets/logo.png")
)
```

= Description

Generate modern manuals, without loosing the simplicity and looks of old
manuals. Instead of the equally nostalgic LaTeX manuals, this package draws
inspiration from the Linux manpages, as they look in terminal emulators until
today, and adapts it to the contemporary formatting possibilities.

This package is designed to universally document any type of program or code,
including Typst packages and templates --- this very manual was written using
this package, so reading it you may see how it looks and reading its source
you may see how it is written.

This manual will be updated only when new versions break or modify something;
otherwise, it will be valid to all newer versions starting by the one documented
here.

#pagebreak()

= Options

Those are the full list of options available and its default values:

```typm
#import "@preview/min-manual:0.1.0": manual
#show: manual.with(
  title: none,
  description: none,
  authors: none,
  cmd: none,
  version: none,
  license: none,
  logo: none,
  manual-author: none,
  toc: false,
  paper: "a4",
  lang: "en",
  justify: true,
  line-space: 0.65em,
  par-margin: 1.2em,
  margin: 1in,
  font: "Arial",
  font-size: 12pt
)
```

Seems like an awful lot to start with, but let's just break down all this to
understand it better, shall we?

#arg(
  "title:", ("string", "content"),
  required: true
)[
  The longer, descriptive and more readable name of what is been documented.
]

#arg(
  "description:", ("string", "content")
)[
  A short description of what is being documented; generally two lines long or
  less.
]

#arg(
  "authors:", ("string", "array"),
  required: true
)[
  The author or authors of what is being documented --- not the manual.
  When more than one author, os an array of strings, in format
  `("NAME <URL>", "NAME <URL>")`, where `<URL>` is optional.
]

#arg(
  "cmd:", ("string", "content")
)[
  The command or code name used to invoke what is being documented.
]

#arg(
  "version:", ("string", "content")
)[
  The version of what is being documented. Useful when different versions have
  different behaviors.
]

#arg(
  "license:", ("string", "content"),
  required: true
)[
  The license of what is being documented --- not the manual.
]

#arg(
  "logo:", "image"
)[
  The logo image of what is being documented.
]

#arg(
  "manual-author:", "string"
)[
  The author of the manual --- not what is being documented. If not set,
  fallback to the first (or only) one of `authors`.
]

#arg(
  "toc:", "boolean"
)[
  Defines whether the manual will have a table of contents or not.
]

#arg(
  "paper:", "string"
)[
  Defines the page paper type --- and its size therefore.
]

#arg(
  "lang:", "string"
)[
  Defines the language of the text.
]

#arg(
  "justify:", "boolean"
)[
  Defines if the text will have justified aliment.
]

#arg(
  "line-space:", "length"
)[
  Defines the space between lines in the document.
]

#arg(
  "par-margin:", "length"
)[
  Defines the margin space after each paragraph. Set it the same as `line-space`
  to remove get paragraphs without additional space in between.
]

#arg(
  "margin:", "length"
)[
  Defines the document margins.
]

#arg(
  "font:", ("string", "array")
)[
  Defines the font families used for the text: a principal font and its fallback.
]

#arg(
  "font-size:", "length"
)[
  Defines the size of the text in the document.
]


= Argument Command

```typm
#import "@preview/min-manual:0.1.0": arg
#arg(
  name, types,
  required: false
)[
  body
]
```

This command offers a convenient way to document the arguments --- or parameters,
or options, or whatever they are called.

#arg(
  "name", ("string", "raw"),
  required: true
)[
  The argument name; can have syntax highlight if set as a raw text, like
  #raw("```LANG NAME```"), where `LANG` is the programming language name.
]

#arg(
  "types", ("string", "array", "none")
)[
  The list of types that the argument value can be.
]

#arg(
  "body", ("content"),
  required: true
)[
  A brief description of what the argument does.
]


= Package Citation Commands

```typm
#import "@preview/min-manual:0.1.0": univ, pip, crate, gh, pkg
#univ(name)
#pip(name)
#crate(name)
#gh(name, user)
#pkg(name, url)
```

These are small helper commands that simplifies the citation of any type of
external package, crate, or library using its repository URL. The `#univ` command
is used to Typst Universe packages, the `#pip` to Pip/Pypi Python modules, the
`#crate` to Rust crates, the `#gh` to GitHub repositories, and `#pkg` to any other
repositories in general.

#arg(
  "name", "string",
  required: true
)[
  The name of the package, or library, or crate, or anything else, as it appears
  in the package repository, e.g.: just the `babel` of
  `https://ctan.org/pkg/babel`.
]

#arg(
  "url", "string",
  required: true
)[
  The package repository URL without package name path, e.g.: just the
  `https://ctan.org/pkg/` of `https://ctan.org/pkg/babel`. Used by `#pkg`.
]

#arg(
  "user", "string",
  required: true
)[
  The GitHub user, as it appears in GitHub repositories, e.g.: just the
  `typst` of `https://github.com/typst/packages`. Used by `#gh`.
]


= Copyright

Copyright #sym.copyright #datetime.today().year() Maycon F. Melo. \
This manual is licensed under MIT terms and rights. \
The manual source code is free software:
you are free to change and redistribute it.  There is NO WARRANTY, to the extent
permitted by law.

The logo was obtained from #link("https://flaticon.com")[Flaticon] website.