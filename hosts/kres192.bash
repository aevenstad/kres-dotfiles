export APPTAINER_CACHEDIR="/bigdata/Jessin/Softwares/.apptainer"
export NXF_APPTAINER_CACHEDIR="/bigdata/Jessin/Softwares/containers"
export NXF_SINGULARITY_CACHEDIR="/bigdata/Jessin/Softwares/containers"

path_append_if_dir "/opt/nvim-linux-x86_64/bin"
export PATH

# Load local secrets from an untracked file if present.
if [ -f "$HOME/.config/shell/secrets.sh" ]; then
  . "$HOME/.config/shell/secrets.sh"
fi


if command -v keychain >/dev/null 2>&1; then
  eval "$(keychain --quiet --eval id_ed25519_kres192 2>/dev/null)"
fi
