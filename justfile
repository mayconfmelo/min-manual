root := justfile_directory()

[private]
default:
	@just --list --unsorted
  
# Continuous compilaton
watch file="template/manual.typ":
  bash scripts/package.sh check "local" "{{root}}"
  mkdir "dev" 2>/dev/null || true
  typst watch "{{file}}" "dev/output.pdf"
  
# Alias for watch
w file="template/manual.typ":
  @just watch "{{file}}"

# One-time compilation
compile file="template/manual.typ":
  bash scripts/package.sh check "local" "{{root}}"
  mkdir "dev" 2>/dev/null || true
  typst compile "{{file}}" "dev/output.pdf"
  
# Alias for compile
c file="template/manual.typ":
  @just compile "{{file}}"
  
# Generate manual
manual:
  bash scripts/package.sh check "local" "{{root}}"
  mkdir "dev" 2>/dev/null || true
  typst compile "docs/manual.typ" "dev/manual.pdf"


# Install package
install target="preview":
  bash scripts/package.sh install "{{target}}" "{{root}}"
  
# Install package in both "local" and "preview" targets
install-all:
  bash scripts/package.sh install "local" "{{root}}"
  bash scripts/package.sh install "preview" "{{root}}"
  
# Remove package
remove target="preview":
  bash scripts/package.sh remove "{{target}}" "{{root}}"

# Link package to installation path to development purposes (version 0.0.0)
dev-link:
  bash scripts/dev-link.sh "{{root}}"

# Release a new package version
version v:
  bash scripts/version.sh "{{v}}" "{{root}}"