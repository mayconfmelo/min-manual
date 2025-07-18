## 0.1.0

- Universal documentation
  - Typst packages
  - Libraries and modules in any language
- Easy way to document arguments/options/parameters with `#arg`
- Extract code structures directly from source codes to use in documentation
  with `#extract`
- Typst Universe package citation with `#univ`
- Python Pip/Pypi module citation with `#pip`
- Rust crate citation with `#crate`
- GitHub repo citation with `#gh`
- General library/package citation with `#pkg`
- Doc-comments with `/** **/` and `///`


### 0.1.1

- Special arg syntax in doc-comments
- Special extract syntax in doc-comments
- Manual file content shown in manual after the doc-comments found in source code
- Support for `#extract(name: "namespace.name")` syntax in Typst-related `lang`
- URL link and footnote with `#url`


## 0.2

- Added: `#extract(namespace)` to get dot notation on elements extracted
- Added: `#extract(rule: "arg")` to format as argument/dict key
- Added: `#extract(rule: "code")` to just return the code string extracted
- Added:Links with footnotes, to make them available in screens and paper
- Updated: Default monospaed font set to Inconsolata