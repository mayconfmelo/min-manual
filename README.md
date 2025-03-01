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

Generate modern manuals, without loosing the simplicity and looks of old
manuals. Instead of the equally nostalgic LaTeX manuals, this package draws
inspiration from the Linux manpages, as they look in terminal emulators until
today, and adapts it to the contemporary formatting possibilities. Allows to
create documentation in dedicated files or extract it from the source code
itself through doc-comments.


## More Information

- [Official manual](https://raw.githubusercontent.com/mayconfmelo/min-manual/refs/tags/0.1.0/docs/pdf/manual.pdf)
- [Example PDF result](https://raw.githubusercontent.com/mayconfmelo/min-manual/refs/tags/0.1.0/docs/pdf/example.pdf)
- [Example Typst code](https://github.com/mayconfmelo/min-manual/blob/0.1.0/template/main.typ)
- [Changelog](https://github.com/mayconfmelo/min-manual/blob/main/CHANGELOG.md)