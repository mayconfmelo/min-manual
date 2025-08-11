// NAME: Minimal Manuals
// TODO: #manual(from-markdown: string)
// TODO: Implement web manual (HTML) when stable

#import "comments.typ": parse as from-comments
#import "markdown.typ": parse as from-markdown


/**
#v(1fr)
#outline()
#v(1.2fr)
#pagebreak()

= Quick Start

```typm
#import "@preview/min-manual:0.1.1": manual
  title: "Package Name",
  description: "Short description, no longer than two lines.",
  authors: "Author <mailto:author@email.com>",
  cmd: "pkg-name",
  version: "0.4.2",
  license: "MIT",
  logo: image("assets/logo.png")
)
```

= Description

Generate modern manuals, without loosing the simplicity and looks of old
manuals. This package draws inspiration from the Linux manpages, as they look in
terminal emulators until today, and adapts it to the contemporary formatting
possibilities.

The package is designed to universally document any type of program or code,
including Typst packages and templates. It allows to create documentation 
separated in dedicated files or extract it from the source code itself through
doc-comments.

This manual will be updated only when new versions break or modify something;
otherwise, it will be valid to all newer versions starting by the one documented
here.

= Options
:show.with manual:
**/
#let manual(
  title: none, /// <- string | content <required>
    /// Descriptive name of the package (what is being documented). |
  description: none, /// <- string | content
    /// Short package description, generally two lines long or less. |
  by: none, /// <- string | content
    /// Manual author (fallback to `authors.at(0)` if not set). |
  package: none, /// <- "pkg:type/namespace/name@version" <required>
    /** Package identification,#footnote[Inspired by
        _#link("https://github.com/package-url/purl-spec/blob/main/README.rst#purl",
        "github.com/package-url/purl-spec/")_] where `pkg:type/namespace/` is
        optional (fallback to `pkg:typst/`) and `name@version` can also be
        written `name:version`. |**/
  authors: none, /// <- string | array of strings <required>
    /// Package author or authors. |
  license: none, /// <- string | content
    /// Package license. |
  url: none, /// <- string | content
    /// Package URL. |
  logo: none, /// <- image | content
    /// Manual logo. |
  use-defaults: false, /// <- boolean
    /// Use Typst defaults instead of min-manual defaults. |
  from-comments: none, /// <- string | read
    /// Retrieve documentation from comments in file. |
  from-markdown: none, /// <- string | read
    /// Retrieve documentation from markdown file (not implemented yet). |
  comment-delim: auto, /// <- array of strings
    /// Set comment delimiters. |
  body,
) = context {
  // Check required arguments
  assert.ne(package, none)
  assert.ne(package, "", message: "#manual(package) cannot be empty")
  assert.ne(title, none)
  assert.ne(authors, none)
  assert.ne(license, none)
  
  import "utils.typ"
  import "comments.typ"
  import "markdown.typ"
  
  let comment-delim = utils.defs.at("comment-delim")
  
  utils.storage(add: "use-defaults", use-defaults)
  utils.storage(add: "comment-delim", comment-delim)
  
  set text(..utils.def(text.size == 11pt, "size", use-defaults))
  
  context {
    let data = utils.purl(package)
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
        text(size: text.size - 2pt, align(right, data.slice(1,2).join(":")))
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
    ): set block(above: par.spacing, below: par.spacing)
    show ref: it => {
      if it.citation.supplement == none {link(locate(here()), it.element.body)}
      else {it}
    }
    show outline: it => align(center, block(width: 80%, align(left, it)))
    
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
      
      if url != none {data.at(1) = link(url)[#data.at(1)#footnote(url)]}
      
      data.push(license)
      
      block(width: 90%, data.map(item => {
        if item != none {
          h(1fr)
          item
          h(1fr)
        }
      }).join())
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


/**
= Command Arguments
:arg:
Defines and explain possible arguments/parameters (see `/tests/commands/arg/`).
**/
#let arg(
  title, /// <- string <required>
    /** Title data: A mandatory identifier, followed by ASCII arrows indicating
        input/output types, which are separated by | markers; a final `<required>`
        marker can define required arguments. |**/
  body
) = context {
  assert.ne(body, [], message: "#arg(body) should not be empty")
  
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
      if type != none {
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
  }
  if display.contains("o") {
    title.push(sym.arrow.r + " ")
    
    let n = if display.contains("i") {1} else {0}
    for type in types.at(n) {
      if type != none {
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
  }
  if required { title.push( box(width: 1fr, align(right)[(_required_)]) ) }
  
  if body != [] {body = pad(left: 1em, body)}
  
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


/**
= Command Extract
:extract:
Extract code from another file or location (see `/tests/commands/extract/`).
**/
#let extract(
  name, /// <- string
    /// Name of the code structure to retrieve. |
  from: auto, /// <- string | file <required>
    /// File from where the code will be retrieved (required in the first use). |
  rule: none, /// <- string | none
    /// Render Typst code in different ways. |
  lang: "typ", /// <- string
    /// Programming language of the code. |
  model: auto, /// <- string
    /// Custom regex pattern to retrieve code. |
  display: none, /// <- string
    /** Custom way to render retrieved code. Replaces `<name>` and `<capt>`
        markers by the name and retrieved code, respectivelly. |**/
) = context {
  import "utils.typ"
  
  let from = from
  
  
  if from == auto {from = utils.storage(get: "extract-from", none)}
  else {utils.storage(add: "extract-from", from)}
  
  // Required named arguments
  assert.ne(from, none, message: "#extract(from) required")
  
  import "utils.typ"
  
  let std-models = (
    "show.with": "(?s)\s*#?let\s+<name>\((.*?)\)\s*=",
    "show": "(?s)\s*#?let\s+<name>\((.*?)\)\s*=",
    "call": "(?s)\s*#?let\s+<name>\((.*?)\)\s*=",
    "set": "(?s)\s*#?let\s+<name>\((.*?)\)\s*=",
    "str": "(?s)\s*#?let\s+<name>\((.*?)\)\s*=",
    "arg": "(?s)\s*<name>\s*:\s*(\(.*?\n\)|.*?)(?:\n|$)",
    "let": "(?s)\s*#?let\s+<name>\s*=\s*(\(.*?\n\)|.*?)(?:\n|$)",
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
    comments = comments.at(0) + ".*|(?s)" + comments.slice(1, 3).join(".*?")
    capt = capt
      .replace(regex(comments), "")  // remove documentation comments
      .replace(regex("^\s*\n+"), "\n") // trim and start with just one \n
      .replace(regex("\n\s*\n"), "\n") // remove blank lines
      .replace(regex("\n+\s*$"), "\n") // trim and end with one \n
  }
  
  // Remove additional indentation
  indent = from.last().text.trim("\n").match(regex("^[ \t]*")).text.len()
  if indent > 0 {
    capt = capt.replace(regex("(?m)^[ \t]{" + str(indent) + "}"), "")
  }
  
  let end
  if rule == "show" {
    let indent = capt.trim("\n").match(regex("^[ \t]*")).text
    let nl = if capt.contains("\n") {"\n"} else {""}

    end = indent + "doc" + nl
  }
  
  if display != none {code = display.replace("<name>", name).replace("<capt>", capt)}
  else if rule == "show.with" {code = "#show: " + name + ".with(" + capt + ")"}
  else if rule == "show" {code = "#show: doc => " + name + "(" + capt + end + ")"}
  else if rule == "call" {code = "#" + name + "(" + capt + ")"}
  else if rule == "set" {code = "#set " + name + "(" + capt + ")"}
  else if rule == "let" {code = "#let " + name.trim() + " = " + capt}
  else if rule == "arg" {code = name + ": " + capt.trim(",")}
  else if rule == "str" {code = capt}
  else {code = capt}
  
  raw(code, lang: lang, block: true)
}
/**
The `#extract` command was created with Typst code in mind, but without
excluding the support for other languages. That's why it has a handy `rule`
option that gets the work done for Typst code, but in other languages requires
to manually use `model` and maybe `display` options to retrieve and show code.
**/


/**
= Command URL
```typ
#url(url, id, text)
```

Creates a paper-friendly link, attached to a footnote containing the URL itself
for readability when printed.

url <- string | label <required>
  URL set to link and shown in footnote.

id <- label
  Label set to the footnote for future reference.

text <- string | content
  Text to be shown in-place as the link itself.
**/
#let url(url, ..data) = {
  h(0pt)
  
  assert(
    data.pos().len() <= 2,
    message: "Received " + str(data.pos().len() + 1) + " arguments (expected 3)"
  )
  
  let note = if type(url) == str {link(url)} else {url}
  let text = data.pos().at(-1, default: url)
  let id = data.pos().at(-2, default: [])

  link(url, emph(text))
  [#footnote(note)#id]
}


/**
== Commands for Package URLs
```typ
#pkg(url)
#univ(name)
#pip(name)
#crate(name)
#gh(slug)
```
Generates paper-friendly links to packages from different sources/platforms using
only essencial data like its name (see `/tests/commands/links/`).

url <- string
  Package URL (used by `#pkg`). The package name is extracted if enclosed in `{}`
  or fallback to the last `/slug` of the URL.

name <- string
  Package name as it is in the source repository/platform (used by `#pip`, 
  `#univ`, and `#crate`).

slug <- string
  A `user/name` path, as it appears in GitHub repository paths (used by `#gh`).
**/
// TODO: Enable labels in #univ, #pip, #crate, #gh
#let pkg(..data) = context {
  let data = data.pos()
  let out = ()
  let target = data.remove(0)
  let text = target
  
  // #pkg
  if data == () {
    if type(target) == label {panic("#pkg(text, label) required")}
    
    text = target.match(regex("\{.*?\}|/[^/]*?$")).text.trim(regex("[/{}]"))
    target = target.replace( regex("\{(.*?)\}"), m => {m.captures.at(0)} )
  }
  else {
    text = data.last().trim(regex(".*?/"))
    
    for m in target.matches(regex("\{.*?\}")) {
      target = target.replace(m.text, data.remove(0))
    }
  }
  
  out.push(target)
  out.push(text)
  
  //[#out]
  url(..out)
}

// Typst packages (Typst Universe)
#let univ(name) = pkg("https://typst.app/universe/package/{pkg}", name)

// Python packages (PyPi/Pip)
#let pip(name) = pkg("https://pypi.org/project/{pkg}", name)

// Rust packages (crates.io
#let crate(name) = pkg("https://crates.io/crates/{pkg}", name)

// GitHub repositories
#let gh(slug) = pkg("https://github.com/{path}/", slug)