#!/usr/bin/env bash
# do not use `export` keyword in this file:
# shellcheck disable=SC2034

# Load defaults
source "$DOROTHY/config/setup.bash"

# Apt / apt-get
# Used by `setup-linux`
# APT_UNINSTALL=()
APT_INSTALL=(
	'traceroute'
)

# Homebrew / brew / https://brew.sh
# Used by `setup-mac-brew`
# You can use `setup-mac-brew --configure` to configure some of these.
# HOMEBREW_UNTAPS=()

HOMEBREW_TAPS=(

# 'ffmpeg'
HOMEBREW_FORMULAS=(
)

# HOMEBREW_SLOW_FORMULAS=()

# 'dbeaver-community'
# 'discord'
# 'firefox-developer-edition'
# 'folding-at-home'
# 'microsoft-teams'
# 'skype'
# 'slack'
# 'steam'
# 'vnc-viewer'
# 'zoom'
HOMEBREW_CASKS=(
	'alfred'
	'google-chrome'
	'keka'
	'obsidian'
	'tailscale'
	'vlc'
)

HOMEBREW_FONTS=(
	'font-cantarell'
	'font-cascadia-code'
	'font-fira-code'
	'font-fira-code-nerd-font'
	'font-fira-mono'
	'font-fira-mono-nerd-font'
	'font-hack' # many editors require this
	'font-hasklig'
	'font-ibm-plex' # many editors require this
	'font-inconsolata-go-nerd-font'
	'font-inter' # many apps require this
	'font-jetbrains-mono'
	'font-jetbrains-mono-nerd-font'
	'font-lato'
	'font-maven-pro'
	'font-monoid'
	'font-montserrat'
	'font-open-sans'
	'font-oxygen'
	'font-oxygen-mono'
	'font-roboto'
	'font-roboto-mono'
	'font-source-code-pro' # many editors require this
	'font-ubuntu'
)
# HOMEBREW_UNINSTALL=()        # for casks and formulas
HOMEBREW_ENCODING_INSTALL='no' # '', 'yes', 'no'

# Utilities to install, these are the [setup-util-*] scripts
# Used by `setup-utils`
# You can use `setup-utils --configure` to configure these.
# 'docker'
SETUP_UTILS=(
	'bash'
	'bat'
	'brew'
	'carapace'
	'curl'
	'dust'
	'git'
	'grex'
	'nu'
	'ripgrep'
	'rust'
	'starship'
	'wget'
	'zsh'
)

if is-mac; then
	SETUP_UTILS+=('vscode')
else
	SETUP_UTILS+=('nano')
fi