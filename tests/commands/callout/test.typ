#import "/src/lib.typ": callout
#set page(width: 15cm, height: auto)


// callout box with custom color fill
#callout(lorem(28), fill: black.lighten(50%), fill-text: white)

// callout box
#callout(lorem(28))

// callout box with title
#callout(lorem(28), title: "Title")

// callout box with title and custom icon (https://heroicons.com/)
#callout(lorem(28), title: "Title", icon: "exclamation-triangle")
