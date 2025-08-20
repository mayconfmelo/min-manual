#import "/src/lib.typ"

#let doc = read("/template/manual.typ")
#let doc = doc.replace(regex("#import.*?min-manual.*"), "")
#let doc = doc.replace(
  regex("(read|image)\(\"/?"),
  m => m.captures.at(0) + "(\"/template/"
)

#eval(
  "[" + doc + "]",
  scope: dictionary(lib)
)