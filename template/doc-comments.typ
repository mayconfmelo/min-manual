#import "@preview/min-manual:0.1.1": manual

// This is another min-manual usage: doc-comments.
// It gathers documentation from special comments in assets/module.typ

#show: manual.with(
  title: "Package Name",
  description: "Short description, no longer than two lines.",
  authors: "Author <@author>",
  cmd: "pkg-name",
  version: "0.4.2",
  license: "MIT",
  logo: image("assets/logo.png"),
  from-comments: read("assets/module.typ")
)

// The content below is shown at the end of the manual:

= Copyright

Copyright #sym.copyright #datetime.today().year() MANUAL AUTHOR. \
This manual is licensed under MIT. \
The manual source code is free software:
you are free to change and redistribute it.  There is NO WARRANTY, to the extent
permitted by law.

The logo was obtained from #link("https://flaticon.com")[Flaticon] website.
