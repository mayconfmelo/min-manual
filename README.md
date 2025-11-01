# Minimal Manuals

<div align="center">

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
</div>


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
  - Any other language
- Retrieval of data from _typst.toml_ package manifest
- Documentation for arguments/options
- Extract code from files
- Showcase code examples and its result
- Terminal simulation
- Customizable callout boxes
- Paper-friendly links (attached to footnotes)
- Quick repository reference
  - Typst Universe packages
  - PyPi packages
  - Rust crates
  - GitHub repositories
  - Any other URL
- Documentation retrieval from Markdown files
  - CommonMark Markdown
  - Typst code support
  - Access to _min-manual_ features (Typst mode)
- Documentation retrieval from source code comments
  - Typst code support
  - All _min-manual_ features
  - Short-hand syntax for some _min-manual_ features


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