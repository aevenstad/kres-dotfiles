#!/usr/bin/env bash

set -euo pipefail

repo_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
backup_dir="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

link_file() {
  local source_path="$1"
  local target_path="$2"

  if [ -L "$target_path" ] && [ "$(readlink -f "$target_path")" = "$(readlink -f "$source_path")" ]; then
    printf 'ok   %s already linked\n' "$target_path"
    return 0
  fi

  if [ -e "$target_path" ] || [ -L "$target_path" ]; then
    mkdir -p "$backup_dir"
    mv "$target_path" "$backup_dir/"
    printf 'mv   %s -> %s/\n' "$target_path" "$backup_dir"
  fi

  ln -s "$source_path" "$target_path"
  printf 'ln   %s -> %s\n' "$target_path" "$source_path"
}

link_file "$repo_dir/.bashrc" "$HOME/.bashrc"
link_file "$repo_dir/.bash_aliases" "$HOME/.bash_aliases"

printf '\n'
printf 'Host config expected at: %s/hosts/%s.bash\n' "$repo_dir" "$(hostname -s 2>/dev/null || hostname)"
printf 'Reload with: source ~/.bashrc\n'
