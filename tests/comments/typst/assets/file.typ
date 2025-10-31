/**
= Extractions

:function:

:show.with function:

:let variable:

:name: typc "arg" => (<name>: <capt>)

:hidden: "// \((width: .*?)\)"


= Options
**/
#let function(
  title, /// <- string
    /// Set title. |
  date: datetime(), /// <- datetime
    /// Set date. |
  color: rgb("#FFF"), /// <- rgb | luma
    /// Set hex color. |
  size: 1cm, /// <- length
    /// Set size. |
  body,
) = { }

#let variable = (
  name: none,
  start: 1,
)

// (width: 5cm)