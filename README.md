# Minimal articles

<center>
  Simple and sober manuals inspired by the OG Linux manpages.
</center>


## Quick Start

```typst
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


## Description

Generate modern manuals, without losing the simplicity and looks of old
manuals. This package draws inspiration from the Linux manpages, as they look in
terminal emulators until today, and adapts it to the contemporary formatting
possibilities.

The package is designed to universally document any type of program or code,
including Typst packages and templates. It allows to create documentation 
separated in dedicated files or extract it from the source code itself through
doc-comments.


## More Information

- [Official manual](https://raw.githubusercontent.com/mayconfmelo/min-manual/refs/tags/0.1.1/docs/manual.pdf)
- [Example PDF result](https://raw.githubusercontent.com/mayconfmelo/min-manual/refs/tags/0.1.1/docs/example.pdf)
- [Example Typst code](https://github.com/mayconfmelo/min-manual/blob/0.1.1/template/manual.typ)
- [Changelog](https://github.com/mayconfmelo/min-manual/blob/main/docs/changelog.md)
- [Development setup](https://github.com/mayconfmelo/min-manual/blob/main/docs/setup.md)


## Experimental 

The doc-comments feature and the `#extract` command are in early development and
currently are experimental. Therefore they may or may not present errors,
usability problems, and unexpected behaviors.
