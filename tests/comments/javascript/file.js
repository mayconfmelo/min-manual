class Class {
  /**
  = Extractions
  
  :method: js " *(?s)(method\((?:\(.*\)|.)*?\)) \{" => <capt>
  
  :method: js "(?s)obj.(method\((?:\(.*\)|.)*?\))" => self.<capt>
  
  :date: js "(date += .+) ///" => <capt>
  
  = Options
  **/
  method(
    title, /// <- string <required>
      /// Set title. |
    date = new Date(), /// <- Date
      /// Set date. |
    color = "#323232", /// <- hex
      /// Set hex color. |
    size = "14pt" /// <- length
      /// Set size. |
  ) {
    // Get date components
    const y = date.getFullYear();
    const m = String(date.getMonth() + 1).padStart(2, '0');
    const d = String(date.getDate()).padStart(2, '0');
    
    date = `${y}/${m}/${d}`;
    
    // Print data
    console.log(
      `${title}` +
      `\n\tToday is ${date}` +
      `\n\tColor: ${color}` +
      `\n\tText size is ${size}`
    );
  }
}

const obj = new Class

obj.method("Defaults")
obj.method(
  "Custom",
  date = new Date(1997, 4, 19),
  color = "#000000",
  size = "20px"
)