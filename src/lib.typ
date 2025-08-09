// NAME: Minimal Manuals
// TODO: #manual(from-markdown: string)
// TODO: Implement web manual (HTML) when stable
// TODO: test use-defaults

#import "comments.typ": parse as from-comments
#import "markdown.typ": parse as from-markdown

#let manual(
  title: none,
  description: none,
  by: none,
  package: none,
  authors: none,
  license: none,
  url: none,
  logo: none,
  toc: true,
  use-defaults: false,
  from-comments: none,
  from-markdown: none,
  comment-delim: ("///", "/**", "**/"),
  body,
) = context {
  // Check required arguments
  assert.ne(package, none)
  assert.ne(title, none)
  assert.ne(authors, none)
  assert.ne(license, none)
  
  import "utils.typ"
  import "comments.typ"
  import "markdown.typ"
  
  utils.storage(add: "use-defaults", use-defaults)
  utils.storage(add: "comment-delim", comment-delim)
  
  set text(..utils.def(text.size == 11pt, "size", use-defaults))
  
  context {
    let (kind, cmd, version) = utils.purl(package)
    let authors = authors
    let by = by
    
    if type(authors) == str {authors = (authors,)}
    if by == none {by = authors.at(0).replace(regex("\s*<.*>\s*"), "")}
    
    set document(
      title: (title, description).join(" - "),
      author: by,
    )
    set text(
      ..utils.def(text.font == "libertinus serif", "font"),
      ..utils.def(text.size == 11pt, "size"),
      hyphenate: true,
    )
    set page(
      ..utils.def(page.margin == auto, "margin"),
      
      header: context if locate(here()).page() > 1 {
        text(size: text.size - 2pt, align(right)[#cmd #version])
      },
      
      footer: context if locate(here()).page() > 1 {
        set text(size: text.size - 2pt)
        
        let final = counter(page).final().at(0)
        let left = if locate(here()).page() != final []
          else [Created with _min-manual_.]
        let middle = counter(page).display("1/1", both: true)
        let right = []
        
        grid(
          columns: (1fr, 1fr, 1fr),
          align: center,
          left, middle, right,
        )
      }
    )
    set par(..utils.def(par.justify == false, "justify"))
    set terms(
      separator: [: ],
      tight: true
    )
    set table(
      stroke: (_,y) => (
         top: if y <= 1 { 1pt } else { 0pt },
         bottom: 1pt,
      ),
      align: (_,y) => (
        if y == 0 { center }
        else { left }
      )
    )
    
    show heading: it => {
      let test = ("libertinus serif", utils.defs.font).contains(text.font)
      set text(..utils.def(test, "font_title"), hyphenate: false)
      set block(above: 1.5em, below: par.leading)
      it
    }
    show heading.where(level: 1): set text(size: text.size * 2)
    show heading.where(level: 2): set text(size: text.size * 1.6)
    show heading.where(level: 3): set text(size: text.size * 1.4)
    show heading.where(level: 4): set text(size: text.size * 1.3)
    show heading.where(level: 5): set text(size: text.size * 1.2)
    show heading.where(level: 6): set text(size: text.size * 1.1)
    show table: set align(center)
    show table.header: set text(weight: "bold")
    show quote.where(block: true): it => pad(x: 1em, it)
    show raw: it => {
      set text(
        ..utils.def(text.lang == "dejavu sans mono", "font_raw"),
        size: text.size + 1pt
      )
      it
    }
    show raw.where(block: true): it => pad(left: 1em, it)
    show footnote.entry: set text(size: text.size - 2pt)
    show selector.or(
      terms, enum, table, figure, list,
      quote.where(block: true), raw.where(block: true),
    ): it => [#v(par.spacing, weak: true)#it#v(par.spacing, weak: true)]
    show ref: it => {
      if it.citation.supplement == none {link(locate(here()), it.element.body)}
      else {it}
    }
    
    // Main header:
    align(center, {
      if logo != none {block(logo, height: 4em)}
      
      v(-2.5em)
      heading(title, level: 1, outlined: false)
      
      text(size: text.size * 1.5)[Manual]
      linebreak()
      
      set text(size: text.size + 2pt)
      
      v(0pt)
      if description != none {description}
      line(length: 90%)
      v(0pt)
      
      set footnote(numbering: "*")
      
      if url != none {cmd = link(url)[#cmd#footnote(url)]}
      
      grid(
        columns: (1fr, 1fr, 1fr, 1fr),
        align: center,
        kind, cmd, version, license,
      )
      v(1em)
      
      for author in authors {
        let name = author.find(regex("^[^<]*")).trim()
        let url = author.find(regex("<(.*)>")).trim(regex("[<> ]"))
        
        // Insert GitHub URL when <@user> is used
        if url.starts-with("@") {
          url = "https://github.com/" + url.slice(1)
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
      v(3em, weak: true)
    })
    
    counter(footnote).update(0)
    
    comments.parse(from-comments, comment-delim)
    markdown.parse(from-markdown)
    
    body
  }
}


// Insert argument/parameter/option explanation:
#let arg(
  title,
  body
) = context {
  let required = title.contains("<required>")
  let output = false
  let display = ""
  let types = ()
  let title = title
  let body = body
  let parts
  let name
  let width
  
  // Remove any <required> from title, if any
  title = title.replace("<required>", "")
  
  if title.contains("<-") {display = "i"}
  if title.contains("->") {display = display + "o"}
  
  parts = title.split(regex("<-|->"))
  name = parts.at(0).trim() + " "
  width = if display == "o" {" " + sym.arrow.r + " "} else {""}
  width = measure(name + width).width + 2pt
  
  if name == "" {panic("Argument name required: " + title)}
  
  //Set types, if any
  for part in parts.slice(1) {
    part = part.replace(regex("\s*\|\s*"), "|").trim()
    part = if part == "nothing" {(none,)} else {part.split("|")}
    
    types.push(part)
  }
  if types.len() > 2 {panic("There should be only one of each '<-' and '->' in " + title)}

  // Show name as raw
  if name.contains(regex("`.*`")) {name = eval(name, mode: "markup")}
  else if type(name) == str {name = raw(name)}
  
  title = (strong(name) + " ",)
  if display.contains("i") {
    for type in types.at(0) {
      title.push(
        box(
          fill: luma(225),
          inset: (x: 3pt, y: 0pt),
          outset: (y: 3pt),
          type
        ) + " "
      )
    }
  }
  if display.contains("o") {
    title.push(sym.arrow.r + " ")
    
    let n = if display.contains("i") {1} else {0}
    for type in types.at(n) {
      title.push(
        box(
          fill: luma(230),
          inset: (x: 3pt, y: 0pt),
          outset: (y: 3pt),
          type
        ) + " "
      )
    }
  }
  if required { title.push( box(width: 1fr, align(right)[(_required_)]) ) }
  
  if body != [] {body = pad(left: 1em, body)}
  //panic(title)
  block(
    breakable: false,
    fill: luma(245),
    width: 100%,
    outset: 5pt,
    [
      #par(hanging-indent: width, title.join())
      #context v(-par.leading * 0.5)
      #body
    ]
  )
}


// Extract an element or structure from a file.
// TODO: Global #extract(model, lang) using states
#let extract(
  from: none,
  rule: none,
  lang: "typ",
  model: auto,
  display: none,
  name,
) = context {
  // Required named arguments
  assert.ne(from, none, message: "#extract(from) required")
  
  import "utils.typ"
  
  let std-models = (
    "show": "(?s)\s*#?let\s+<name>\((.*?)\)\s*=",
    "show.with": "(?s)\s*#?let\s+<name>\((.*?)\)\s*=",
    "call": "(?s)\s*#?let\s+<name>\((.*?)\)\s*=",
    "let": "(?s)\s*#?let\s+<name>\s*=\s*(\(.*?\n\)|.*?)(?:\n|$)",
    "set": "(?s)\s*#?let\s+<name>\((.*?)\)\s*=",
    "arg": "(?s)\s*<name>\s*:\s*(\(.*?\n\)|.*?)(?:\n|$)",
    //"str": "(?s)\s*<name>\s*.*?\s(.*?)\s* ",
  )
  let rule = if rule == none {"call"} else {rule}
  let model = if model == auto {std-models.at(rule)} else {model}
  let comments = utils.storage(get: "comment-delim")
  let model = model.replace("<name>", name)
  let from = from.matches(regex(model))
  let indent
  let code
  let capt
  
  if not lang.contains("typ") {rule = str}
  
  if from != () and from.last().captures != () {capt = from.last().captures.at(0)}
  else {panic("Could not extract '" + name + "' using '" + model + "'")}
  
  if comments != none {
    import "comments.typ": esc
    
    comments = comments.map(item => {esc(item)})
    let re = comments.at(0) + ".*|(?s)" + comments.slice(1, 3).join(".*?")
    
    capt = capt.replace(regex(re), "")
      .replace(regex(",\s*\n+"), ",\n") // removes blank lines
      .replace(regex("^\s*\n+"), "\n") // start with just one \n
      .replace(regex("\s*\n+$"), "\n") // end with just one \n
  }
  
  // Remove additional indentation
  indent = from.last().text.trim("\n").match(regex("^[ \t]*")).text.len()
  if indent > 0 {
    capt = capt.replace(regex("(?m)^[ \t]{" + str(indent) + "}"), "")
  }
  
  if display != none {code = display.replace("<name>", name).replace("<capt>", capt)}
  else if rule == "show.with" {code = "#show: " + name + ".with(" + capt + ")"}
  else if rule == "show" {code = "#show: doc => " + name + "(" + capt + "  doc\n)"}
  else if rule == "call" {code = "#" + name + "(" + capt + ")"}
  else if rule == "set" {code = "#set " + name + "(" + capt + ")"}
  else if rule == "let" {code = "#let " + name.trim() + " = " + capt}
  else if rule == "arg" {code = name + ": " + capt.trim(",")}
  //else if rule == "str" {code = capt}
  else {code = capt}
  
  raw(code, lang: lang, block: true)
}


// Create a link and footnote to an url
#let url(..data) = {
  h(0pt)
  if data.pos().len() > 2 {
    panic("Expects 2 arguments (received " + str(data.pos().len()) + ")")
  }

  let url = data.pos().at(0)
  let text = if data.pos().len() == 2 {data.pos().at(1)} else {url}
  
  
  // Fallback text to url
  if text == auto {text = url}
  
  link(url, emph(text))
  footnote(
    link(url)
  )
}

// Cite a package/library/crate repository by URL.
#let pkg(name, base-url) = url(base-url + name, name)

// Shortcut to cite Typst packages from Typst Universe.
#let univ(name) = pkg(name, "https://typst.app/universe/package/")

// Shortcut to cite Python packages from Pypi.
#let pip(name) = pkg(name, "https://pypi.org/project/")

// Shortcut to cite Rust packages from crates.io
#let crate(name) = pkg(name, "https://crates.io/crates/")

// Shortcut to cite GitHub repositories
#let gh(user, name) = pkg(name, "https://github.com/" + user + "/")