#import "@preview/min-manual:0.1.2": manual

#show: manual.with(
  title: "Minimal Manuals",
  description: "Simple and sober manuals inspired by the OG Linux manpages.",
  authors: "Maycon F. Melo <@mayconfmelo>",
  package: "min-manual:0.1.2",
  url: "typst.app/universe/package/min-manual/",
  license: "MIT",
  logo: image("docs/assets/manual-logo.png"),
  from-comments: read("src/lib.typ") +
    read("src/comments.typ") +
    read("src/markdown.typ")
)


= Copyright

Copyright #sym.copyright #datetime.today().year() Maycon F. Melo. \
This manual is licensed under MIT. \
The manual source code is free software: you are free to change and redistribute
it.  There is NO WARRANTY, to the extent permitted by law.

The logo was obtained from #link("https://flaticon.com")[Flaticon] website.