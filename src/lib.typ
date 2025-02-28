// Manual package

#let manual-cmd-state = state("manual-cmd")
#let manual-version-state = state("manual-version")

#let manual(
  title: none,
  description: none,
  authors: none,
  cmd: none,
  version: none,
  license: none,
  logo: none,
  manual-author: none,
  from-comments: none,
  toc: false,
  paper: "a4",
  lang: "en",
  justify: true,
  line-space: 0.65em,
  par-margin: 1.2em,
  margin: 1in,
  font: "Arial",
  font-size: 12.5pt,
  body,
) = {
  // Check required arguments
  let req = (
    title: title,
    authors: authors,
    license: license
  )
  for arg in req.keys() {
    assert.ne(
      req.at(arg), none,
      message: "Missing argument: " + arg
    )
  }
  
  manual-cmd-state.update(cmd)
  manual-version-state.update(version)
  
  // Turn string authors into array
  if type(authors) == str {
    authors = (authors,)
  }
  
  // First author is treated as manual author, if not set.
  if manual-author == none {
    manual-author = authors.at(0)
  }

  set document(
    title: title + " - " + description,
    author: manual-author,
    date: datetime.today(),
  )
  
  set page(
    paper: paper,
    margin: margin,
    header: context if locate(here()).page() > 1 {
        // Right-side header
        text(size: font-size - 2pt)[ #align(right)[#cmd #version] ]
      },
    footer: text(size: font-size - 2pt)[
        #context if locate(here()).page() > 1 {
          if locate(here()).page() == counter(page).final().at(0) {
            // Last page:
            box(width: 1.25fr)[ Manual created with _min-manual_.]
            box(width: 0.5fr)[
              #align(center)[
                #counter(page).display("1/1", both: true)
              ]
            ] 
            box(width: 1.25fr)[]
          } else {
            // Other pages:
            align(center)[
              #counter(page).display("1/1", both: true)
            ]
          }
        }
      ],
  )
  
  set par(
    justify: justify,
    leading: line-space,
    spacing: par-margin
  )
  set text(
    font: font,
    size: font-size,
    lang: lang
  )
  set terms(
    separator: [: ],
    tight: true
  )
  set table(
    stroke: (_, y) => (
       top: if y <= 1 { 1pt } else { 0pt },
       bottom: 1pt,
      ),
    align: (_, y) => (
      if y == 0 { center }
      else { left }
    )
  )
  
  show table: set align(center)
  show table.header: set text(weight: "bold")
  show quote.where(block: true): it => pad(x: 1em, it)
  show raw.where(block: true): it => pad(left: 1em, it)
  show footnote.entry: set text(size: font-size - 2pt)
  show raw: set text(font: "Inconsolata", size: font-size)
  
  show selector.or(
    terms, enum, table, figure, list,
    quote.where(block: true), raw.where(block: true),
  ): it => {
    v(0.5em)
    it
    v(0.5em)
  }
  
  show selector.or(
    heading.where(level: 1),
    heading.where(level: 2),
    heading.where(level: 3),
  ): it => upper(it)
  
  // Manual main header:
  align(center)[
    #if logo != none {
      block(height: 4em)[
        #logo
      ]
    }
    #text(size: font-size * 2, weight: "bold")[#title]
    #linebreak()
    #text(size: font-size * 1.5)[Manual]
    #linebreak()
    #v(0pt)
    #if description != none {
      text(size: font-size + 2pt)[#description]
    }
    #line(length: 90%)
    #v(0pt)
    #text(size: font-size + 2pt)[
      #if     cmd != none { box(width: 1fr)[#cmd]     }
      #if version != none { box(width: 1fr)[#version] }
      #if license != none { box(width: 1fr)[#license] }
    ]
    #v(0pt)
    
    // Symbol numbering for authors footnotes
    #set footnote(numbering: "*")
    
    // Insert authors
    #for author in authors {
      let name = author.find(regex("^[^<]*")).trim()
      let url = author.find(regex("<(.*)>")).trim(regex("[<> ]"))
      
      // Insert GitHub URL when <@user> is used
      if url.at(0) == "@" {
        url = "https://www.github.com/" + url.slice(1)
      }
      
      if author != none {
        name.trim()

        if url != none {
          url = url.trim(regex("[<>]"))
          footnote(link(url))
        }
        linebreak()
      }
    }
    #v(2em)
    // Reset footnote counter
    #counter(footnote).update(0)
  ]
  
  // TOC generation
  if toc == true {
    show outline.entry.where(level: 1): it => {
      v(font-size, weak: true)
      strong(upper(it))
    }
    align(center)[
      #block(width: 80%)[
        #outline(indent: 1.5em)
      ]
    ]
    v(2em)
  }
  
  if from-comments == none {
    body
  }
  else {
    // Retrieves all special "///" and "/*/.../*/" doc-comments
    let doc = from-comments
      .replace(regex("(.*?),?\n.*?(///|/\*\*)\s*->(.*)"), m => {
        // Find argument NAME to set it as: NAME -> TYPES <REQUIRED> \n BODY
        if m.captures.at(0).contains(regex("\w(?::.*)?")) {
          m.captures.at(1) + m.captures.at(0) + " ->" + m.captures.at(2)
        }
      })
      .matches(regex("///.*|(?s)/\*\*.*?\*\*/")) // Removes doc-comments marks
      .map(
        it => it.text
          .trim(regex("///\s*|/\*\*|\*\*/|\n")) // Removes ///  /**  **/ and \n
          .replace(regex("(?m)^[ \t]*\*+[ \t]*"), "") // Removes additional *
          .replace(regex("\n\n+"), "\n\n")  // Normalize \n\n+ to \n\n
          .replace(regex("(.*)\s*->\s*(.*)\n?(?s)(.*)?"), m => {
            // Get arguments NAME, TYPES, REQUIRED, and BODY data
            let name = m.captures.at(0).trim(regex("[\s,]"))
            let types = repr(
                m.captures.at(1)
                  .replace(regex("\s*|\s*"), "")
                  .split("|")
              )
            let body = m.captures.at(2)
            let required = "false"
            
            // Checks if argument is required
            if types.contains("<required>") {
              types = types.replace(regex("<.*>"), "")
              required = "true"
            }
            
            // Create an #arg command with the data retrieved
            "#arg(`" + name + "`, " + types + ", required:" + required + ")[" + body + "]"
          })
          .replace(regex(":(\w+?):\s*(\w+)\s*(?:`(\w+)?`)?"), m => {
            // Retrieve :NAME: RULE `LANG`
            // Returns #export(NAME, RULE, LANG, from-comments)
            let name = repr(m.captures.at(0))
            let rule = repr(m.captures.at(1))
            let lang = repr(m.captures.at(2))
            
            // Default LANG value, if none are given
            if lang == "none" {
              lang = repr("typm")
            }
            
            "#extract(
               name: " + name + ",
               rule:" + rule + ",
               lang:" + lang + ",
            "+ repr(from-comments) + ")"
          })
          .trim()
      )
      
    // Import min-manual to eval context
    doc.insert(0, "#import \"@preview/min-manual:0.1.0\": *\n\n")
    
    // Evaluate the Typst code exgtracted from the doc-comments
    eval(
      doc.join("\n\n"),
      mode: "markup"
    )
  }
}


// Insert argument explanation in the text:
// TODO: Maybe change syntax to #arg("NAME -> TYPE | TYPE <REQUIRED>")[BODY]
#let arg(
  name,
  types,
  body,
  required: false
) = {
  v(0.5em)
  block(breakable: false)[
    #par(
      spacing: 0.9em,
      leading: 0.65em,
    )[
      #strong[
        // If the name is string, show as raw.
        // If the name is raw, show it as it is.
        #if type(name) == str {
          raw(name)
        } else {
          name
          h(1em)
        }
      ]
      #if types != none {
        // Turn string types into array:
        if type(types) == str {
          types = (types,)
        }
        for type in types {
          box(
            fill: luma(235),
            inset: (x: 3pt, y: 0pt),
            outset: (y: 3pt),
            type
          ) + " "
        }
        
        // Insert (required) note
        if required == true {
          box(width: 1fr)[
            #align(right)[ (_required_) ]
          ]
        }
      }
      #linebreak()
      #if body != [] {
        // Show padded text:
        pad(left: 1em)[#body]
      }
    ]
  ]
}


// Extract an element or structure from a file.
#let extract(
  name: none,
  rule: none,
  model: "(?s)#?let\s+<name>\((.*)\)\s*=",
  lang: "typm",
  body
) = {
  name = name.trim()
  model = model.replace("<name>", name)
  
  if type(body) != str {
    panic("Wrong \"body\" argument type: " + type(body))
  }
  
  // Extract last match
  // TODO: use text instead of captures
  let extr = body.matches(regex(model)).last().captures.at(0)
  
  extr = extr
    .replace(regex("//.*|(?s)/\*.*?\*/"), "") // Removes comments
    .replace(",", ",\n") // Adds extra \n just in case
    .replace(regex("\n\s+"), "\n") // Removes extra spaces after \n
    .replace(regex("\n+$"), "") // Removes last \n
    .replace(regex("\n"), "\n  ") // Adds exactly 2 spaces at each line start
  
  context {
  let imp
  
  // Typst #import statement
  if lang.contains("typ") {
    let pkg = manual-cmd-state.final() + ":" + manual-version-state.final()
    imp = "#import \"@preview/" + pkg + "\": "+ name + "\n"
  }
  
  let code
  if rule == none {
    // Function definition
    code = imp + "#let " + name + "(" + extr + "\n)"
  }
  else if rule == "show" {
    // Show rule
    code = imp + "#show: " + name + ".with(" + extr + "\n)"
  }
  else if rule == "set" {
    // Set rule
    code = imp + "#set " + name + "(" + extr + "\n)"
  }
  
  // Generate raw code from extracted data.
  raw(code, lang: lang, block: true)
  
  }
}


// Cite a package/library/crate repository by URL.
#let pkg(name, url) = [#link(url + name)[#emph(name)]#footnote(url + name)]

// Shortcut to cite Typst packages from Typst Universe.
#let univ(name) = pkg(name, "https://typst.app/universe/package/")

// Shortcut to cite Python packages from Pypi.
#let pip(name) = pkg(name, "https://pypi.org/project/")

// Shortcut to cite Rust packages from crates.io
#let crate(name) = pkg(name, "https://crates.io/crates/")

// Shortcut to cite GitHub repositories
#let gh(name, user) = pkg(name, "https://github.com/" + user + "/")