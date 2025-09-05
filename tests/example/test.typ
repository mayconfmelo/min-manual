#import "/src/lib.typ": example, manual
#import "/src/utils.typ": enable-example
#set page(height: auto, margin: 1cm)
#show raw.where(block: true): enable-example

/*#show: manual.with(
  title: "Package Name",
  description: "Short description, no longer than two lines.",
  authors: "Author <@author>",
  package: "pkg-name:0.4.2",
  license: "MIT",
)*/

#example(
  output-align: top,
  "top-aligned _Typst_ code *example*"
)
#v(1cm)

#example(
  output-align: bottom,
  "bottom-aligned _Typst_ code *example*"
)
#v(1cm)

#example(
  output-align: left,
  "left-aligned _Typst_ code *example*"
)
#v(1cm)

#example(
  output-align: right,
  "right-aligned _Typst_ code *example*"
)
#v(1cm)


#example(raw("auto-aligned short *example*"))
#v(1cm)


#example(raw("auto-aligned longer _Typst_ code *example*"))
#v(1cm)


#example(
  ``` Some _Typst_ code *example* ```,
  [Arbitrary _Typst_ output *example*]
)
#v(1cm)


```eg
Syntax _Typst_ code *example*
```
#v(1cm)


```example
Syntax _Typst_ code *example*
```