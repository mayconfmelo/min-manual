#import "/src/lib.typ": url, pkg, univ, pip, crate, gh
#set page(width: auto, height: auto)

#grid(
  columns: (auto, auto),
  gutter: 1em,
  [*URL:                 *], url("https://typst.app", "Typst website"),
  [*Typst Universe:      *], univ("pkg"),
  [*Python PyPi:         *], pip("pkg"),
  [*Rust crate:          *], crate("pkg"),
  [*Package (LaTeX CTAN):*], pkg("pkg", "https://ctan.org/pkg/"),
  [*Package (Perl CPAN): *], pkg("PKG::Package", "https://metacpan.org/pod/"),
  [*GitHub repo:         *], gh("user", "pkg"),
)

#v(3cm)