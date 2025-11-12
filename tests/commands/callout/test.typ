#import "/src/lib.typ": callout
#set page(width: 15cm, height: auto)


// callout box
#callout(lorem(28))

// callout box with title
#callout(lorem(28), title: "Title")

// callout box with title and custom icon (https://heroicons.com/)
#callout(lorem(28), title: "Title", icon: "exclamation-triangle")

// callout box with custom color fill
#callout(lorem(28), background: black.lighten(50%), text: white)

// callout box with customized in GitHub-ish style
#callout(
  lorem(28),
  title: "Note",
  text: ( title: (fill: blue) ),
  background: (
    fill: none,
    stroke: (left: 3pt + blue),
    outset: (left: 1em, bottom: 0.45em),
    inset: (left: 0pt),
  ),
)