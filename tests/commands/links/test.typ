#import "/src/lib.typ": url, pkg, univ, pip, crate, gh
#set page(width: auto, height: auto)


#grid(
  columns: (auto, auto),
  gutter: 1em,
  [*LuaRocks:      *], pkg("https://luarocks.org/modules/alerque/decasify", <lua>),
  [*Typst Universe:*], univ("decasify", <univ>),
  [*Python PyPi:   *], pip("decasify", <pipy>),
  [*Rust crate:    *], crate("decasify", <rust>),
  [*GitHub repo:   *], gh("alerque/decasify", <gh>),
  [*Releases:      *], url("https://github.com/alerque/decasify/releases", <url>),
)

#line()
Label references:

#grid(
  columns: (auto, auto),
  gutter: 1em,
  [*LuaRocks:      *], pkg(<lua>),
  [*Typst Universe:*], univ(<univ>),
  [*Python PyPi:   *], pip(<pipy>),
  [*Rust crate:    *], crate(<rust>),
  [*GitHub repo:   *], gh(<gh>),
  [*Releases:      *], url(<url>),
  
)


#v(1cm)