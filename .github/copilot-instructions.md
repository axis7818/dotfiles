# Copilot Instructions for dotfiles Repository

## Project Overview

Personal dotfiles repository managed by [dotpatina](https://github.com/axis7818/dotpatina) - a templating tool that deploys configuration files across macOS and Windows systems using variable substitution.

## Architecture

- **Patina manifests**: [patina-mac.toml](patina-mac.toml) and [patina-windows.toml](patina-windows.toml) define which dotfiles deploy to which system locations
- **Template files**: Config files in subdirectories (e.g., [zsh/zshrc](zsh/zshrc), [git/gitconfig](git/gitconfig)) use `<{{variable}}>` syntax for variable substitution
- **Variables**: [vars.toml](vars.toml) (gitignored) provides user-specific values; [sample-vars.toml](sample-vars.toml) shows the template
- **Platform separation**: Mac uses forward slashes in paths; Windows uses backslashes (see manifest files for examples)

## Template Variable Syntax

Variables use `<{{namespace.key}}>` format:

- `<{{me.email}}>` - User's email address
- `<{{me.first_name}} {{me.last_name}}>` - User's full name
- `<{{git.credentials}}>` - Multi-line credential configuration

Example from [git/gitconfig](git/gitconfig):

```gitconfig
[user]
    email = <{{me.email}}>
    name = <{{me.first_name}} {{me.last_name}}>
```

## Adding New Dotfiles

1. Create the template file in an appropriate subdirectory (or create new subdirectory)
2. Add variable placeholders using `<{{var.name}}>` syntax
3. Register in [patina-mac.toml](patina-mac.toml) and/or [patina-windows.toml](patina-windows.toml):
   ```toml
   [[files]]
   template = "path/to/source"
   target = "~/destination/path"
   tags = ["category"]
   ```
4. Add any new variables to [sample-vars.toml](sample-vars.toml) (for documentation)

## Deployment Workflow

Users deploy dotfiles with: `dotpatina apply patina-mac.toml --vars vars.toml`

The [brew/install.sh](brew/install.sh) script separately manages Homebrew package installation - it's idempotent and safe to rerun.

## Conventions

- Template source files live in tool-named subdirectories
- Multi-line variable values (like `git.credentials`) use triple-quoted TOML strings
- Target paths use `~` for home directory on both platforms
- Don't commit [vars.toml](vars.toml) - it contains personal credentials
