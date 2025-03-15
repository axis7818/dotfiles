#!/usr/bin/env sh

# install homebrew if not installed
echo "Checking if Homebrew is installed..."
if ! command -v brew > /dev/null; then
	echo "Installing Homebrew..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	echo "Homebrew installed."
else
	echo "Homebrew already installed."
fi
echo ""

# install brew packages
echo "Installing brew packages..."
packages=(
	"dive"                             # Docker image explorer
	"fd"
	"ffmpeg"
	"fnm"                              # Node version manager
	"font-symbols-only-nerd-font"
	"fx"                               # JSON viewer
	"fzf"                              # Fuzzy finder
	"imagemagick"
	"jq"                               # JSON processor
	"lazygit"                          # Git terminal UI
	"nvm"                              # Node version manager
	"poppler"
	"ripgrep"
	"sevenzip"
	"stats"                            # Mac system resource monitor
	"yazi"                             # File manager
	"zoxide"
)

for package in "${packages[@]}"; do
	echo "Package: $package"
	if brew list "$package" > /dev/null 2>&1; then
		echo "$package already installed."
	else
		echo "Installing $package..."
		brew install "$package"
		echo "$package installed."
	fi
	echo ""
done
