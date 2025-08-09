// NAME: Comment Handling submodule (internal)


// FEAT: comment.esc() escapes all non alphanumerical characters and apply regex
#let esc(text) = {
  let pattern = ""
  
  for letter in text {
    if letter.contains(regex("^[0-9A-Za-z]$")) {pattern = pattern + letter}
    else {pattern = pattern + "\\" + letter}
  }
  
  pattern
}

// FEAT: comment.arg-handle() enables option/arg documentation
#let handle-args(doc, delims) = {
  let delim = delims.slice(0,2).join("|")
  
  doc.replace(regex("(.*?),?\s*(" + delim + ")\s*<-(.*)"), m => {
    let name = m.captures.at(0).trim(regex("[\s,;]"))
    let mark = m.captures.at(1)
    let types = m.captures.at(2)
    
    name = name.replace(regex(":.*"), ":")
    
    mark + name + "<-" + types
  })
}


// FEAT: comment.get() retrieves documentation from the text content
#let clean(doc, delims) = {
  let all = delims.at(0) + ".*|(?s)" + delims.slice(1, 3).join(".*?")
  let open = delims.at(0) + "|" + delims.slice(1).join("|")

  doc.matches(regex(all)).map(
    m => m.text
      .trim(regex(open))
      .replace(regex("(?m)^(?:\s*\*+)?\s?"), "")  // removes *
      .replace(regex("\n\n+|\|$"), "\n\n")
  )
}


// FEAT: comment.extract() retrieves code from this or any other document
#let extract(doc, doc-orig) = {
  // USAGE: :title: lang "model" => display
  // TODO: Separate re in parts
  let re = "(?s):([^\n]+?):(?:<s>(\w+)<s>)?(?:<s>\"(.*?)\")?(?:<s>=>\s*(.*?))?"
  let s = " *\n? *"
  let pattern = re.replace("<s>", s)
  
  doc.replace(regex("(?m)^ *" + pattern + " *(?:\n|$)"), m => {
    let title = m.captures.at(0).split(" ")
    let rule = title.slice(0, -1).join(" ")
    let name = title.last()
    let lang = m.captures.at(1)
    let model = m.captures.at(2)
    let display = m.captures.at(3)
    let args = ()
    
    if name == "" {panic("Invalid name in " + m.text.trim())}
    if rule != none {rule = rule.trim()}
    
    //panic(display)
    args.push(repr(name) + ", ")
    args.push("from: " + repr(doc-orig) + ", ")
    
    if rule != none {args.push("rule: " + repr(rule) + ", ")}
    if lang != none {args.push("lang: " + repr(lang) + ", ")}
    if model != none {args.push("model: " + repr(model) + ", ")}
    if display != none {args.push("display: " + repr(display) + ", ")}

    "\n\n#extract(" + args.join() + ")\n\n"
  })
}


// FEAT: comment.args() parses argument notation syntax
#let args(doc) = {
  doc.replace(regex("\s*(.*\s*(?:<-|->)\s*.*)\n?(?s)(.*?)(?:\n\n|$)"), m => {
    let title = m.captures.at(0)
    let body = m.captures.at(1)
    
    // Insert raw in title, if not already
    if not title.starts-with(regex("`.*`")) {
      title = title.replace(regex("\s*(.*?)\s*(<-|->)"), m => {
        "`" + m.captures.at(0) + "`" + m.captures.at(1)
      })
    }
    
    // Create an #arg command with the data retrieved
    "\n\n#arg(" + repr(title) + ")[" + body + "]\n\n"
  })
}


// MAIN: comment.parse() handles doc-comments inside content
#let parse(doc, delims) = {
  if doc == none {return}
  
  delims = delims.map(item => {esc(item)})
  //for i in range(delims.len()) {delims.at(i) = esc(delims.at(i))}
  
  let doc-orig = doc
  
  doc = handle-args(doc, delims)
  doc = clean(doc, delims)
  
  doc.insert(0, "#import \"@preview/min-manual:0.1.2\": *\n\n")
  
  doc = doc.join("\n")
  doc = args(doc)
  doc = extract(doc, doc-orig)
  
  eval( doc, mode: "markup", scope: (doc: doc-orig) )
}