# Dotfiles

This repo is set up for sharing shell config across multiple Ubuntu machines while keeping host-specific paths separate.

## Layout

- `.bashrc`: shared interactive shell setup
- `.bash_aliases`: shared aliases that make sense everywhere
- `hosts/<hostname>.bash`: per-machine exports, paths, and aliases
- `install.sh`: symlinks the tracked files into `$HOME` and backs up existing files

## Install on a machine

Run:

```bash
./install.sh
source ~/.bashrc
```

The host-specific file is chosen from `hostname -s`. On this machine that is `kres-pc`, so the active file is `hosts/kres-pc.bash`.

## Add another machine

1. SSH to the machine.
2. Clone this repo somewhere in your home directory.
3. Copy the template and rename it to that machine's short hostname:

```bash
cp hosts/example-host.bash hosts/$(hostname -s).bash
```

4. Fill in the machine-specific paths and aliases.
5. Run `./install.sh`.

## Notes

- Shared config now checks whether optional tools exist before using them.
- `setxkbmap` only runs when a graphical session is present.
- Host-specific paths stay out of the shared `.bashrc`, which makes the repo usable on the SSH-only machines too.
- Secrets such as `GITHUB_TOKEN` should not be stored in this repo. If needed, load them from an untracked file like `~/.config/shell/secrets.sh` inside a host file.
