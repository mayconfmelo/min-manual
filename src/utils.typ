// Parses package URLs (pkg:type/namespace/name@version)
#let purl(url) = {
  if url.starts-with("pkg:") {url = url.slice(4)} // remove optional pkg scheme
  if not url.contains("/") {url = "typst/" + url} // fallback namespace to typst

  url.match(regex("^(.*)/(.*?)(?:[@:](.*))?$")).captures
}


// Default delimiters for documentation comments
#let comment-delim = ("///", "/**", "**/")


// Enables a #raw(lang) to simulate terminal windows (used in #show)
#let enable-terminal(doc) = {
  show selector.or(
    raw.where(lang: "term"),
    raw.where(lang: "terminal"),
  ): set raw(
    syntaxes: "assets/term.sublime-syntax",
    theme: "assets/term.tmTheme"
  )
  
  show selector.or(
    raw.where(lang: "term"),
    raw.where(lang: "terminal"),
  ): it => {
    import "@preview/toolbox:0.1.0": storage
    set text(fill: rgb("#CFCFCF"))
    
    pad(
      x: 1em,
      block(
        width: 100%,
        fill: rgb("#1D2433"),
        inset: 8pt,
        radius: 2pt,
        it
      )
    )
  }
  
  doc
}


// Enables a #raw(lang) to generate source-result boards (used in #show raw)
#let enable-example(elem) = {
  import "lib.typ": example

  show raw: set text(size: text.size)
  
  if ("eg", "example").contains(elem.lang) {example(elem.text, block: true)}
  else {elem}
}