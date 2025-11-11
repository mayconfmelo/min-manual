--[[-
= Extractions

:feature: lua "(?s)(function feature\((?:\(.*\)|.)*?\))" => <capt>

:feature: lua "(?s)(feature\((?:\(.*\)|.)*?\))" => <capt>

:date: lua "(date += .+)" => <capt>

= Options
-]]--
function feature(
  title, --- <- string
    --- Set title. |
  date, --- <- os.time
    --- Set date. |
  color, --- <- table
    --- Set RGB color. |
  size --- <- string
    --- Set size. |
)
  -- Default values
  title = title or "Defaults"
  date = os.date("*t", date) or os.date("*t")
  color = color or {r = 50, g = 50, b = 50}
  size  = size or "14pt"
  
  -- Print data
  print(title)
  print("\tToday is " .. date.year .. "/" .. date.month .. "/" .. date.day)
  print("\tColor: #"
    .. string.format("%02x", color.r)
    .. string.format("%02x", color.g)
    .. string.format("%02x", color.b)
  )
  print("\tText size is " .. size)
end


feature()
print()
feature(
  "Custom",
  os.time({year = 1997, month = 5, day = 19}),
  {r = 0, g = 0, b = 0},
  "20px"
)