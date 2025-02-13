# Minimal articles

<center>
  Simple and sober manuals inspired by the OG linux manpages.
</center>


# Quick Start

```typst
#import "@preview/min-manual:0.1.0": manual
#show: manual.with(
  title: "Longer, Readable Name",
  description: "Short description, generally two or less lines.",
  authors: "You Name <https://your-url.com>",
  cmd: "short-name",
  version: "0.1.0",
  license: "MIT",
  logo: image("logo.png")
)
```


# Description

Generate modern manuals, without loosing the simplicity and looks of old
manuals. Instead of the equally nostalgic LaTeX manuals, this package draws
inspiration from the Linux manpages, as they look in terminal emulators until
today, and adapts it to the contemporary formatting possibilities.


# More Information

- [Official manual](docs/pdf/manual.pdf)
- [Example PDF result](docs/pdf/example.pdf)
- [Example Typst code](template/manual.typ)


# Setup

This project uses `just` to automate all development processes. Run `just` or
refer to the _justfile_ for more information.


### Release

Install the package in default _preview_ namespace:

```
just install preview
```

To uninstall it:

```
just remove preview
```


### Testing

Install the package in a separated _local_ namespace:

```
just install local
```

To uninstall it:

```
just remove local
```

The command `just install-all` installs it in both _preview_ and _local_
namespaces at the same time.


### Development

Create a direct symbolic link between this project and and the _local_ namespace,
under a special _0.0.0_ version:

```
just dev-link
```

This way, every change made into the package will instantly be available to 
Typst by using a `@local/min-article:0.0.0` import.

This command is a toggle: run it once, and it creates the link; run it again and
the link is removed; and so on.