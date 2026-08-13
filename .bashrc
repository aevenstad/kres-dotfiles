# Only configure interactive shells.
case $- in
*i*) ;;
*) return ;;
esac

dotfiles_source="${BASH_SOURCE[0]}"
if command -v readlink >/dev/null 2>&1; then
  resolved_source="$(readlink -f -- "$dotfiles_source" 2>/dev/null)" || resolved_source=""
  if [ -n "$resolved_source" ]; then
    dotfiles_source="$resolved_source"
  fi
fi
dotfiles_dir="$(cd -- "$(dirname -- "$dotfiles_source")" && pwd)"
hostname_short="$(hostname -s 2>/dev/null || hostname)"

path_prepend_if_dir() {
  [ -d "$1" ] || return 0
  case ":$PATH:" in
  *":$1:"*) ;;
  *) PATH="$1:$PATH" ;;
  esac
}

path_append_if_dir() {
  [ -d "$1" ] || return 0
  case ":$PATH:" in
  *":$1:"*) ;;
  *) PATH="$PATH:$1" ;;
  esac
}

nvk() {
  NVIM_APPNAME=nvim-kickstart nvim "$@"
}

export OSH="$HOME/.oh-my-bash"
OSH_THEME="font"
OMB_USE_SUDO=true
OMB_PROMPT_SHOW_PYTHON_VENV=true

completions=(
  git
  composer
  ssh
)

aliases=(
  general
)

plugins=(
  git
  bashmarks
)

if [ -r "$OSH/oh-my-bash.sh" ]; then
  source "$OSH/oh-my-bash.sh"
fi

if command -v fastfetch >/dev/null 2>&1; then
  fastfetch
fi

if [ -n "${DISPLAY:-}" ] && command -v setxkbmap >/dev/null 2>&1; then
  setxkbmap no -variant nodeadkeys >/dev/null 2>&1
fi

if [ -f "$dotfiles_dir/.bash_aliases" ]; then
  source "$dotfiles_dir/.bash_aliases"
fi

path_prepend_if_dir "/usr/local/go/bin"
path_prepend_if_dir "$HOME/.local/bin"
#path_append_if_dir "/opt/nvim-linux-x86_64/bin"
export PATH

export NVM_DIR="$HOME/.nvm"
if [ -s "$NVM_DIR/nvm.sh" ]; then
  . "$NVM_DIR/nvm.sh"
fi
if [ -s "$NVM_DIR/bash_completion" ]; then
  . "$NVM_DIR/bash_completion"
fi

host_config="$dotfiles_dir/hosts/${hostname_short}.bash"
if [ -f "$host_config" ]; then
  source "$host_config"
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/bigdata/Jessin/Softwares/miniforge3/bin/conda' 'shell.bash' 'hook' 2>/dev/null)"
if [ $? -eq 0 ]; then
  eval "$__conda_setup"
else
  if [ -f "/bigdata/Jessin/Softwares/miniforge3/etc/profile.d/conda.sh" ]; then
    . "/bigdata/Jessin/Softwares/miniforge3/etc/profile.d/conda.sh"
  else
    export PATH="/bigdata/Jessin/Softwares/miniforge3/bin:$PATH"
  fi
fi
unset __conda_setup
# <<< conda initialize <<<
