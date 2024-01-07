# . "$HOME/.asdf/asdf.sh"
# . "$HOME/.asdf/completions/asdf.bash"
# This only works under interactive shells
eval "$($HOME/.local/share/rtx/bin/rtx activate bash)"
# this works under non-interactive shells
export PATH="$HOME/.local/share/rtx/shims:$PATH"

# for pipx completion
export PATH="$PATH:$HOME/.local/bin"


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  elif [ -d ~/.bash_completions ]; then
    for file in ~/.bash_completions/*; do
      echo "Loading completion file $file"
      . "$file"
    done
  fi
fi

if [ -d ~/.bash_completions ]; then
    for file in ~/.bash_completions/*; do
        # echo "Loading completion file $file"
        . "$file"
    done
fi



export FLYCTL_INSTALL="$HOME/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

{{ if and (eq .chezmoi.os "linux") (.chezmoi.kernel.osrelease | lower | contains "microsoft") }}
# WSL-specific code
export BROWSER=/usr/bin/wslview
alias open="/usr/bin/wslview"

export DOCKER_HOST=unix:///var/run/docker.sock
export DOCKER_HOST_PATH="/var/run/docker.sock"
{{ end }}

export PATH=/usr/bin:$PATH


{{ if eq .site "server" }}
export DOCKER_HOST=unix:///run/user/$UID/docker.sock
export DOCKER_HOST_PATH=${DOCKER_HOST#unix://}
{{ end }}


export EDITOR="$(which code) --wait"
export SUDO_EDITOR=EDITOR

export PATH="$PATH:/snap/bin"
export PATH="$PATH:$HOME/.cargo/bin"

export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac


eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# run here since it checks for the existence cmd 
if command -v zoxide &> /dev/null; then
    eval "$(zoxide init bash)"
fi

if command -v mcfly &> /dev/null; then
    eval "$(mcfly init bash)"
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if  rtx list flutter &> /dev/null ; then
    export FLUTTER_ROOT="$(rtx where flutter)"
fi

if command -v thefuck &> /dev/null; then
    eval $(thefuck --alias)
fi

# fix poetry keyring https://github.com/python-poetry/poetry/issues/1917
export PYTHON_KEYRING_BACKEND=keyring.backends.fail.Keyring


export RAN_BASHRC=1

if command -v starship &> /dev/null
then 
    eval "$(starship init bash)"
fi

# [[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
