#import "/src/lib.typ": url, pkg, univ, pip, crate, gh
#set page(width: auto, height: auto)

#grid(
  columns: (auto, auto),
  gutter: 1em,
  [*URL:                   *], url("https://typst.app", <url>)[Typst website],
  [*URL by reference:      *], url(<url>)[Typst website],
  [*Typst Universe:        *], univ("pkg-typ"),
  [*Python PyPi:           *], pip("pkg-py"),
  [*Rust crate:            *], crate("pkg-rs"),
  [*Package (LaTeX CTAN):  *], pkg("https://ctan.org/pkg/pkg-tex"),
  [*Package (Perl CPAN):   *], pkg("https://metacpan.org/pod/PKG::PackagePL"),
  [*GitHub repo:           *], gh("user/pkg-gh"),
)

#v(3cm)