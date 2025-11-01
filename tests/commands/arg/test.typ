#import "/src/lib.typ": arg
#set page(width: 15cm, height: auto)

#arg("name: <- type | type | type <required>")[
  Required argument.
]
#arg("name: <- type | type | type")[
  Optional argument.
]
#arg("name: -> type | type | type")[
  Possible output types.
]
#arg("name: <- type | type | type -> type | type <required>")[
  Possible input and output types.
]
#arg("```typ #feature(name)``` -> type | type | type")[
  Syntax highlight.
]
#arg("```typ #set feature(name)```")[
  No input nor output values.
]
#arg("name: <- type | type | type | type | type | type | type | type | type | type | type | type | type | type | type | type <required>")[
  Long list of input values.
]
#arg("name: -> type | type | type | type | type | type | type | type | type | type | type | type | type | type | type | type <required>")[
  Long list of output values.
]
#arg("name: <- type | type | type | type | type | type | type | type -> type | type | type | type | type | type | type | type <required>")[
  Long list of input and output values.
]
