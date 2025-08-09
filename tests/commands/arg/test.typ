#import "/src/lib.typ": arg
#set page(width: 15cm, height: auto)

#arg("name: <- type | type | type <required>")[
  A required argument.
]
#arg("name: <- type | type | type")[
  An optional argument.
]
#arg("name: -> type | type | type")[
  An argument showing result values
]
#arg("name: <- type | type | type -> type")[
  An argument showing input and result values
]
#arg("```typ #feature(name)``` -> type | type | type")[
  An argument with syntax highlight.
]
#arg("```typ #set feature(name)```")[
  An argument without any type.
]
#arg("name: -> type | type | type | type | type | type | type | type | type | type | type | type | type | type | type | type <required>")[
  An argument with so much possible types that they break line.
]
