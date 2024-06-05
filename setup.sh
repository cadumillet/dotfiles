# Install developer command line tools if needed
if ! command -v xcode-select -p &> /dev/null; then
  echo "Installing command line tools"
  xcode-select --install
fi

# Install Rosetta 2 for Macs with M1 chip
# `uname -m` will return 'arm64' for M1 (instead of x86_64 for Intel)
if [[ $(uname -m) == 'arm64' ]]; then
  softwareupdate --install-rosetta
fi

# Install homebrew
if ! command -v bash &> /dev/null; then
  echo "Installing homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Google Chrome

# Kitty Terminal

# VS Code

# Install java and some other tools
brew tap homebrew/cask-versions
brew install --cask zulu11 # java11 jdk recommended by react-native
brew install git hub exa bat nvm gh awscli python redis terraform cocoapods watchman

# Install nerd fonts (technically this is optional, but helps if using `exa`)
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

# Login to github CLI
# You'll need to authenticate via a web browser; follow prompts
gh auth login -p https -h GitHub.com -w