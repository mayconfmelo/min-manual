#set page(width: auto, height: auto, margin: 1em)

/**
= Extractions

:function:

:show.with function:

:arg date:

= Options
**/
#let function(
  title, /// <- string
    /// Set title. |
  date: datetime.today(), /// <- datetime
    /// Set date. |
  color: rgb("#323232"), /// <- rgb | luma
    /// Set RGB color. |
  size: 14pt, /// <- length
    /// Set size. |
) = {
  let date = str(date.year()) + "/" + str(date.month()) + "/" + str(date.day())
  
  title
  linebreak()
  
  h(1em)
  "Today is "
  date
  linebreak()
  
  h(1em)
  "Color: "
  repr(color)
  linebreak()
  
  h(1em)
  "Text size is "
  repr(size)
}

#function("Defaults")

#function(
  "Custom",
  date: datetime(year: 1997, month: 5, day: 19),
  color: rgb("#000"),
  size: 20mm
)