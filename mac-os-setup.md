# Mac OS Setup

This file contains helpful setup instructions for a new mac.

See [brew-list](./brew-list) for a list of installed brew formulae and casks.

## MacOS Settings

These are a few helpful commands to configure Mac OS settings.

```bash
# Enable key repeat on hold
defaults write -g ApplePressAndHoldEnabled -bool false

# Disable the dock autohide animation
defaults write com.apple.dock autohide-time-modifier -int 0; killall Dock

# or optionally, set a shorter animation duration
defaults write com.apple.dock autohide-time-modifier -float 0.1; killall Dock
```
