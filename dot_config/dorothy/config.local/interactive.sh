
### Interactive 
if [ "$(command -v ~/.local/bin/mise)" ]; then
  eval "$(~/.local/bin/mise activate bash)"
fi

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

if [ -d ~/.bash_completions ]; then
    for file in ~/.bash_completions/*; do
        # echo "Loading completion file $file"
        . "$file"
    done
fi

export FLYCTL_INSTALL="$HOME/.fly"

if is-wsl {
  # sudo apt update
  export BROWSER=/usr/bin/wslview
  alias open="/usr/bin/wslview"
}

docker_socket="/var/run/docker.sock"
docker_socket_2="/run/user/$UID/docker.sock"
if [ -S "$docker_socket" ]; then
  export DOCKER_HOST=unix://"$docker_socket"
  export DOCKER_HOST_PATH="$docker_socket"
elif [ -S "$docker_socker_2" ]; then
  export DOCKER_HOST=unix://"$docker_socket_2"
  export DOCKER_HOST_PATH="$docker_socket_2"
else
  $VERBOSE_INIT && echo "No docker socket found"
fi

if [ "$(command -v code)" ]; then
  export EDITOR="$(which code) --wait"
  export SUDO_EDITOR=$EDITOR
elif [ "$(command -v micro)" ]; then
  export EDITOR="$(which micro)"
  export SUDO_EDITOR=$EDITOR
elif [ "$(command -v nano)" ]; then
  export EDITOR="$(which nano)"
  export SUDO_EDITOR=$EDITOR
else
  echo "No editor found"
fi


export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac



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
