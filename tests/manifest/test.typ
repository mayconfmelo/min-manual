#import "/src/lib.typ": manual

#show: manual.with(
  title: "Package Name",
  manifest: toml("typst.toml")
)