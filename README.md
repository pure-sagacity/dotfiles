# Dotfiles

Personal configuration files for my development environment.

## What is included

This repository currently manages configuration under `.config`, including:

- `fish`
- `nvim`
- `tmux`
- `ghostty`
- `gh`
- `raycast`
- `containers`
- `kubectl`
- `github-copilot`
- plus a few tool-specific folders

## Requirements

- macOS or Linux
- `git`
- `stow` (for symlink management)

## Install

### 1. Clone the repository

```bash
git clone https://github.com/pure-sagacity/dotfiles.git "$HOME/Dotfiles"
cd "$HOME/Dotfiles"
```

### 2. Back up existing config

```bash
mkdir -p "$HOME/.config-backup"
for dir in .config/*; do
	name="$(basename "$dir")"
	if [ -e "$HOME/.config/$name" ] || [ -L "$HOME/.config/$name" ]; then
		mv "$HOME/.config/$name" "$HOME/.config-backup/$name"
	fi
done
```

### 3. Symlink configs

```bash
stow .
```

## Update

```bash
cd "$HOME/Dotfiles"
git pull
```

If new config directories were added, run the symlink step again.

## Notes

- Keep machine-specific secrets out of this repository.
- If a tool behaves unexpectedly after linking, restore from `.config-backup` and re-link that tool manually.
