class Class {
  /**
  :feature: js "(?s)( *<name>\((?:\(.*\)|.)*?\)) \{" => Class.<capt>
  == Options
  Options retrieved from JavaScript source code:
  **/
  feature(
    title, /// <- string <required>
      /// Set title. |
    date = new Date(), /// <- Date
      /// Set date. |
    color = "#FFF", /// <- hex
      /// Set hex color. |
    size = "1cm" /// <- length
      /// Set size. |
  ) { }
}