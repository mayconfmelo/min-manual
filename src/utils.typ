// Parses package URLs
#let purl(url) = {
  // REPR: pkg:type/namespace/name@version

  // Remove optional pkg: scheme
  if url.starts-with("pkg:") {url = url.slice(4)}
  // Fallback type/ to typst
  if not url.contains("/") {url = "typst/" + url}

  url.match(regex("^(.*)/(.*?)(?:[@:](.*))?$")).captures
}


// Default delimiters for documentation comments
#let comment-delim = ("///", "/**", "**/")


// FEAT: #show: utils.enable-term() allows "term/terminal" #raw syntax
#let enable-term(doc) = {
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
    
    // Disable #raw 1em padding here
    storage.add("raw-padding", false)
    
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
    
    // Re-enable #raw 1em padding
    storage.add("raw-padding", true)
  }
  
  doc
}


// FEAT: #show: utils.enable-example() allows "eg/example" #raw lang
#let enable-example(elem) = {
  import "lib.typ": example

  show raw: set text(size: text.size)
  
  if ("eg", "example").contains(elem.lang) {example(elem.text, block: true)}
  else {elem}
}