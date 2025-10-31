class Class {
  /**
  
  = Extractions
  
  #columns(2)[
  
    :str Class: js "(?s)class (<name> \{.*?\})\s//<name>"
    
    :method: js "(?s)( *<name>\((?:\(.*\)|.)*?\)) \{" => Class.<capt>
    
    #colbreak()
    
    :str variable: js "(?s)( *<name> =.*?)\s*\/\/<name>"
    
    :name: js "( *<name> =.*?),\n" => {<capt>}
    
    :str hidden: js "(?s)(\{\s*width =.*\})"
  
  ]
  
  = Options
  **/
  method(
    title, /// <- string <required>
      /// Set title. |
    date = new Date(), /// <- Date
      /// Set date. |
    color = "#FFF", /// <- hex
      /// Set hex color. |
    size = "1cm" /// <- length
      /// Set size. |
  ) { }
  
  variable = {
    name = none,
    start = 1
  } //variable
} //Class

/*
{
  width = 5cm
}
*/