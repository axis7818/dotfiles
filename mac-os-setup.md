# Mac OS Setup

This file contains helpful setup instructions for a new mac.

## MacOS Settings

These are a few helpful commands to configure Mac OS settings.

```bash
# Enable key repeat on hold
defaults write -g ApplePressAndHoldEnabled -bool false

# Speed up the dock autohide animation
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.05
killall Dock
```

## Homebrew

See [Brewfile](./Brewfile) for a list of installed brew formulae and casks.

```bash
# Update Brewfile with dependencies
brew bundle dump --force --describe
```
