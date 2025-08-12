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

- In-depth project redesign and fixes
- Added: `#manual(from-markdown)` implementation (experimental)
- Added: `#url` for paper-friendly links (with footnotes)
- Added: New `#extract(rule)` options
  - `"show.with"`
  - `"let"`
  - `"arg"`
  - `"str"`
- Updated: `#extract(rule: none)` &rarr; `#extract(rule: "call")`
- Updated: `#extract(display)` set how the code extracted will be shown
- Updated: Manual file content appended to the manual when using comments
- Updated: _TeX Gyre Heros_ as text font
- Updated: _TeX Gyre Adventor_ as heading font
- Updated: _Fira Mono_ as monospaced font