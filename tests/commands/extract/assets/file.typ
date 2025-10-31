// Examples for extraction

// Function with arguments
#let function(
  title: none,
  date: datetime.today(),
  color: luma(250),
  size: auto,
  body,
) = { }

// Multiline variable
#let variable = (
  "Foo", "Bar", "Baz", datetime.today(),
)

// Override variable (code mode)
#{
  override = "Quz"
}

#calling(name: "John")