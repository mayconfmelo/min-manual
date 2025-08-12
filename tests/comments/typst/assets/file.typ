/**
:show feature:
== Options
Options retrieved from Typst source code:
**/
#let feature(
  title, /// <- string
    /// Set title. |
  date: datetime.today(), /// <- datetime
    /// Set date. |
  color: rgb("#FFF"), /// <- rgb | luma
    /// Set hex color. |
  size: 1cm, /// <- length
    /// Set size. |
) = { }