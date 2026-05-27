# Dotfiles

Personal configuration files for my development environment.


## What this installs

### Nix system packages

- `neovim` - A modern terminal text editor with strong Lua and plugin support.
- `pay-respects` - A shell helper that provides command correction abilities

### Fonts

- `nerd-fonts.jetbrains-mono` - JetBrains Mono with patched glyphs for icons and prompt symbols.

### Homebrew packages

- `bat` - A `cat` replacement with syntax highlighting and line numbers.
- `carapace` - Shell completion engine
- `cmake` - A cross-platform build system generator.
- `cmatrix` - A Matrix-style terminal animation for fun and demos.
- `podman` - A daemonless container engine.
- `podman-compose` - Compose-style orchestration for Podman.
- `eza` - A feature-rich replacement for `ls`.
- `fastfetch` - A fast system information summary tool.
- `fd` - A simpler, faster file search tool.
- `ffmpeg` - A media conversion and processing toolkit.
- `fish` - The interactive shell used by this dotfiles setup.
- `fzf` - A fuzzy finder for files, commands, and interactive selection.
- `gcc` - The GNU C and C++ compiler toolchain.
- `gnupg` - Tools for encryption, signing, and key management.
- `kubernetes-helm` - The package manager for Kubernetes applications.
- `kubectl` - The Kubernetes command-line client.
- `lima` - A lightweight Linux VM manager for local development.
- `minikube` - A local Kubernetes cluster for testing and learning.
- `nasm` - An assembler commonly used for low-level development.
- `neovim` - A terminal editor for everyday coding work.
- `ninja` - A fast build system used by many compiled projects.
- `nodejs` - The JavaScript runtime used by many tooling workflows.
- `openssh` - SSH clients and servers for secure remote access.
- `openssl` - Cryptography libraries and command-line utilities.
- `pass` - A Unix password manager built around GPG.
- `pinentry-mac` - A macOS passphrase prompt for GPG operations.
- `qemu` - Virtualization and emulation for running other systems.
- `ripgrep` - A fast text search tool for code and logs.
- `rustup` - The Rust toolchain installer and version manager.
- `sevenzip` - Archive compression and extraction support.
- `sqlite` - A small embedded SQL database engine.
- `starship` - A fast, customizable shell prompt.
- `stow` - A symlink manager for dotfiles.
- `tmux` - A terminal multiplexer for persistent sessions.
- `unzip` - Archive extraction for ZIP files.
- `wakeonlan` - A utility for sending Wake-on-LAN packets.
- `wget` - A command-line file downloader.
- `xh` - A friendly HTTP client for APIs and quick requests.
- `xz` - Compression utilities for `.xz` archives.
- `yazi` - A fast terminal file manager.
- `yt-dlp` - A media downloader for video and audio sites.
- `zoxide` - A smarter directory jumper that learns frequent paths.
- `caddy` - A modern web server and reverse proxy.

### Homebrew casks

- `copilot-cli` - GitHub Copilot's command-line companion.
- `discord` - A chat client for community and team conversations.
- `ghostty` - A GPU-accelerated terminal emulator.
- `openclaw` - A macOS utility app for grabbing and managing files.
- `podman-desktop` - A graphical interface for Podman containers.
- `rar` - Tools for creating and extracting RAR archives.
- `slack` - Team chat and collaboration software.
- `wireshark-app` - A packet capture and network analysis app.
- `iina` - A polished macOS media player.
- `localsend` - A local network file-sharing app.
- `tailscale-app` - The Tailscale VPN client for macOS.

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

If you are setting up a brand-new Mac, use the `On a new machine` section below instead of this older short form.


## On a new machine

This is the exact path from a clean Apple Mac to a fully configured setup.

### 1. Install Nix

This repository uses Nix flakes and nix-darwin, so Nix must be installed before the first activation.

```zsh
curl -fsSL https://install.determinate.systems/nix | sh -s -- install
```

Restart the terminal after the installer finishes.

### 2. Clone this repository

```bash
git clone https://github.com/pure-sagacity/dotfiles.git "$HOME/Dotfiles"
cd "$HOME/Dotfiles"
```

### 3. Link the config directories

If you are starting from a clean machine, there is nothing to back up. If you already have files under `~/.config`, move them aside before linking.

```bash
mkdir -p "$HOME/.config-backup"
for dir in .config/*; do
	name="$(basename "$dir")"
	if [ -e "$HOME/.config/$name" ] || [ -L "$HOME/.config/$name" ]; then
		mv "$HOME/.config/$name" "$HOME/.config-backup/$name"
	fi
done

stow .
```

### 4. Activate nix-darwin for the first time

Use the flake directly for the first bootstrap. Replace `MacBook-Pro` with your host name if you change it in [.config/nix/flake.nix](.config/nix/flake.nix). **Make sure to add the required `--extra-experimental-features` flag for both `nix-command` and `flakes` if you haven't set it in your Nix config.**

```bash
nix run nix-darwin -- switch --flake "$HOME/Dotfiles/.config/nix#MacBook-Pro"
```

After that first run, the normal rebuild path is:

```bash
sudo darwin-rebuild switch --flake "$HOME/Dotfiles/.config/nix#MacBook-Pro"
```

### 7. Daily workflow

After the first bootstrap, the shell aliases in [.config/fish/config.fish](.config/fish/config.fish) provide the normal maintenance commands:

```bash
update
rebuild
upgrade
```

`update` refreshes the flake inputs, `rebuild` applies the current system config, and `upgrade` does both in one step.


## Update

```bash
cd "$HOME/Dotfiles"
git pull
```

If new config directories were added, run the symlink step again.

## Notes

- Keep machine-specific secrets out of this repository.
- If a tool behaves unexpectedly after linking, restore from `.config-backup` and re-link that tool manually.
