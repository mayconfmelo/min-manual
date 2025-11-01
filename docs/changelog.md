# 0.0.0


## 0.1.0

- Universal documentation
  - Typst packages
  - Libraries and modules in any language
- `#arg` document arguments/options/parameters
- `#extract` retrieves code from other files or location
- Package URLs
  - `#univ` for Typst Universe
  - `#pip` for Python PyPi
  - `#crate` for Rust crates
  - `#gh` for GitHub repo
  - `#pkg` for other libraries/packages
- Documentation from comments `/** **/` and `///`
- Use `#extract` in comments
- Use `#arg` in comments


## 0.2.0

- Project redesign and fixes
- Added: `#manual(from-markdown)` implementation (experimental)
- Added: `#url` for paper-friendly links (with footnotes)
- Added: New `#extract(rule)` options
  - `"show.with"`
  - `"let"`
  - `"arg"`
  - `"str"`
- Updated: `#extract(rule: none)` &rarr; `#extract(rule: "call")`
- Updated: `#extract(display)` set how the extracted code will be shown
- Updated: Manual file content appended to the manual when using comments
- Updated: _TeX Gyre Heros_ as text font
- Updated: _TeX Gyre Adventor_ as heading font
- Updated: _Fira Mono_ as monospaced font
- Updated: General manual formatting


### 0.2.1

- Added: `#example` evaluates Typst code or custom content as code example
- Added: `#raw(lang: "eg|example")` to invoke `#example` using ``` syntax
- Added: `#raw(lang: "term|terminal")` to emulate a terminal window, with prompt highlight
- Updated: `#manual(from-markdown)` new HTML5 syntax for `#arg`

## 0.3.0


- Internal re-design
- Added: `#manual(manifest)` to retrieve data from _typst.toml_ manifest
- Updated: `#manual(use-defaults)` &rarr; `#manual(typst-defaults)`