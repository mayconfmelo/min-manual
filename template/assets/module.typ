/**
 * = Quick Start
 * 
 * ```typm 
 * // Minimal initialization example, like:
 * #import "@preview/module:0.4.2": feature
 * #show: feature.with(
 *   name: "Do Something",
 *   when: datetime.today(),
 * )
 * ```
 *
 * = Description
 * 
 * To create this manual, the `doc-comments.typ` file reads the `assets/module.typ`
 * source code, which will be documented, and gather documentation from special
 * comments there; then _min-manual_ handles everything and Typst generates
 * this document.
 * 
 * #lorem(100)
 * 
 * = Options
 * These are all the options avalilable and its respetive default values, if any:
 * 
 * :feature: show `typm`
**/
#let feature(
  name: none, 
    /** -> string | content | none <required>
      * Explanation of what is this argument, what it does, and how to set it. **/
  text: none,
    /** -> string | content | none
      * Explanation of what is this argument, what it does, and how to set it. **/
  when: datetime.today(),
    /** -> datetime
      * Explanation of what is this argument, what it does, and how to set it. **/
  notify: true,
    /** -> boolean
      * Explanation of what is this argument, what it does, and how to set it. **/
  body,
    /// -> content | string
) = {

  /**
   * = Code Explanation
   * 
   * #lorem(50)
   * 
   * #lorem(100)
  **/
  
}

This example file mimics a Typst module with embedded doc-comments, used by
_min-manual_ to generate documentation. As you can see, there's no doc-comments
appearing here, because Tyspt considers them to be regular comments.

Please, run `doc-comments.typ` to see how the doc-comments looks in a full
 manual.


/**
 * = Copyright
 * 
 * Copyright #sym.copyright #datetime.today().year() MANUAL AUTHOR. \
 * This manual is licensed under MIT. \
 * The manual source code is free software:
 * you are free to change and redistribute it.  There is NO WARRANTY, to the extent
 * permitted by law.
**/

/// The logo was obtained from #link("https://flaticon.com")[Flaticon] website.
