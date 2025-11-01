# Minimal Manuals

<center align="center">

<p class="hidden">
Modern but sober manuals inspired by the manpages of old.
</p>


<p class="hidden">
  <a href="https://typst.app/universe/package/min-manual">
    <img src="https://img.shields.io/badge/dynamic/xml?url=https%3A%2F%2Ftypst.app%2Funiverse%2Fpackage%2Fmin-manual&query=%2Fhtml%2Fbody%2Fdiv%2Fmain%2Fdiv%5B2%5D%2Faside%2Fsection%5B2%5D%2Fdl%2Fdd%5B3%5D&logo=typst&label=Universe&color=%23239DAE&labelColor=%23353c44" /></a>
  <a href="https://github.com/mayconfmelo/min-manual/tree/dev/">
    <img src="https://img.shields.io/badge/dynamic/toml?url=https%3A%2F%2Fraw.githubusercontent.com%2Fmayconfmelo%2Fmin-manual%2Frefs%2Fheads%2Fdev%2Ftypst.toml&query=%24.package.version&logo=github&label=Development&logoColor=%2397978e&color=%23239DAE&labelColor=%23353c44" /></a>
</p>

[![Manual](https://img.shields.io/badge/Manual-%23353c44)](https://raw.githubusercontent.com/mayconfmelo/min-manual/refs/tags/0.2.1/docs/manual.pdf)
[![Example PDF](https://img.shields.io/badge/Example-PDF-%23777?labelColor=%23353c44)](https://raw.githubusercontent.com/mayconfmelo/min-manual/refs/tags/0.2.1/docs/example.pdf)
[![Example SRC](https://img.shields.io/badge/Example-SRC-%23777?labelColor=%23353c44)](https://github.com/mayconfmelo/min-manual/blob/0.2.1/template/manual.typ)
[![Changelog](https://img.shields.io/badge/Changelog-%23353c44)](https://github.com/mayconfmelo/min-manual/blob/main/docs/changelog.md)
[![Contribute](https://img.shields.io/badge/Contribute-%23353c44)](https://github.com/mayconfmelo/transl/blob/main/docs/contributing.md)

<p class="hidden">

[![Tests](https://github.com/mayconfmelo/min-manual/actions/workflows/tests.yml/badge.svg)](https://github.com/mayconfmelo/min-manual/actions/workflows/tests.yml)
[![Build](https://github.com/mayconfmelo/min-manual/actions/workflows/build.yml/badge.svg)](https://github.com/mayconfmelo/min-manual/actions/workflows/build.yml)
[![Spellcheck](https://github.com/mayconfmelo/min-manual/actions/workflows/spellcheck.yml/badge.svg)](https://github.com/mayconfmelo/min-manual/actions/workflows/spellcheck.yml)

</p>
</center>


## Quick Start

```typst
#import "@preview/min-manual:0.3.0": manual
#show: manual.with(
  title: "Package Name",
  manifest: toml("typst.toml"),
)
```


## Description

Generate modern manuals without losing the simplicity of old manpages. This
package draws inspiration from old manuals while adopting the facilities of
modern tools, like Markdown and documentation embedded in comments. The design
aims to be sober: a minimal informative header, technical text in comfortable
fonts and well-formatted code examples.


## Feature List

- Universal documentation
  - Typst packages
  - Typst templates
  - Source code in any other language
- Retrieval of data from _typst.toml_ package manifest
- `#arg` document arguments/parameters
- `#extract` retrieves code from other files or location
- `#example` displays code-result examples
  - Typst result
    - `#raw(lang: "eg|example")` syntax
  - Custom content result
- `#raw(lang: "term|terminal")` emulates a terminal window, with prompt highlight
- Paper-friendly links (attached to footnotes)
  - `#url` for general links 
  - `#univ` for Typst Universe packages
  - `#pip` for Python PyPi packages
  - `#crate` for Rust crates
  - `#gh` for GitHub repos
  - `#pkg` for packages of any source
- Documentation in standalone Typst files
- Documentation in standalone Markdown files (experimental)
  - CommonMark Markdown
  - Typst code support
  - All _min-manual_ features (Typst-only)
  - Special HTML syntax for `#arg`
- Documentation embedded in source code (comments)
  - Typst code support
  - All _min-manual_ features
  - Special syntax for `#extract`
  - Special syntax for `#arg`


## Default Fonts

**Text:**
[TeX Gyre Heros](https://www.gust.org.pl/projects/e-foundry/tex-gyre/heros/qhv2.004otf.zip) or
Arial

**Headings:**
[TeX Gyre Adventor](https://www.gust.org.pl/projects/e-foundry/tex-gyre/adventor/qag2_501otf.zip) or 
Century Gothic

**Mono:**
[Fira Mono](https://fonts.google.com/specimen/Fira+Mono) or
[Inconsolata](https://fonts.google.com/specimen/Inconsolata)