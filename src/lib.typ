// Manual package

#let manual(
  title: none,
  description: none,
  authors: none,
  cmd: none,
  version: none,
  license: none,
  logo: none,
  manual-author: none,
  toc: false,
  paper: "a4",
  lang: "en",
  justify: true,
  line-space: 0.65em,
  par-margin: 1.2em,
  margin: 1in,
  font: ("Arial", "Inconsolata"),
  font-size: 12.5pt,
  body,
) = {
  let req = (title: title, authors: authors, license: license)
  for arg in req.keys() {
    if req.at(arg) == none {
      panic("Missing required argument: " + arg)
    }
  }

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
    footer: text(
        size: font-size - 2pt,
      )[
        #context if locate(here()).page() > 1 {
          // Last page footer:
          if locate(here()).page() == counter(page).final().at(0) {
            box(width: 1.25fr)[ Manual created with _min-manual_.]
            box(width: 0.5fr)[
              #align(center)[
                #locate(here()).page()/#numbering("1", ..counter(page).final())
              ]
            ]
            box( width: 1.25fr)[]
          // Footer in other pages:
          } else {
            align(center)[
              #locate(here()).page()/#numbering("1", ..counter(page).final())
            ]
          }
        }
      ],
  )
  
  set par(justify: justify, leading: line-space, spacing: par-margin)
  set text(font: font, size: font-size, lang: lang)
  set terms(separator: [: ], tight: true)
  
  show raw: set text(font: "Inconsolata", size: font-size)
  show quote.where(block: true): it => pad(x: 1em, it)
  show raw.where(block: true): it => pad(left: 1em, it)
  show footnote.entry: set text(size: font-size - 1pt)
  
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

    #set footnote(numbering: "*")
    
    // Insert authors
    #for author in authors {
      let name = author.find(regex("^[^<]*"))
      let url = author.find(regex("<(.*)>"))
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

  body
}


// Insert argument explanation in the text:
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
        // Turn sole string tyoe into a array:
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
        // Insert _(required)_ note
        if required == true {
          box(width: 1fr)[
            #align(right)[ (_required_) ]
          ]
        }
      }
      #linebreak()
      // Show padded text:
      #pad(left: 1em)[#body]
    ]
  ]
}


// Cite a package/library/crate repository.
#let pkg(name, url) = [#link(url + name)[#emph(name)]#footnote(url + name)]

// Shortcut to cite Typst packages
#let univ(name) = pkg(name, "https://typst.app/universe/package/")

// Shortcut to cite Python packages
#let pip(name) = pkg(name, "https://pypi.org/project/")

// Shortcut to cite Rust packages
#let crate(name) = pkg(name, "https://crates.io/crates/")

// Shortcut to cite GitHub repositories
#let gh(name, user) = pkg(name, "https://github.com/" + user + "/")