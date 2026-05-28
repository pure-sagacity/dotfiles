{
  enable = true;
  enableFishIntegration = true;
  brews = [
    "bat"
    "carapace"
    "cmake"
    "cmatrix"
    "podman"
    "podman-compose"
    "eza"
    "fastfetch"
    "fd"
    "ffmpeg"
    "fish"
    "fzf"
    "gcc"
    "gnupg"
    "kubernetes-helm"
    "kubectl"
    "lima"
    "minikube"
    "nasm"
    "neovim"
    "ninja"
    "nodejs"
    "openssh"
    "openssl"
    "pass"
    "pinentry-mac"
    "qemu"
    "ripgrep"
    "rustup"
    "sevenzip"
    "sqlite"
    "starship"
    "stow"
    "tmux"
    "unzip"
    "wakeonlan"
    "wget"
    "xh"
    "xz"
    "yazi"
    "yt-dlp"
    "zoxide"
    "caddy"
  ];
  casks = [
    "copilot-cli"
    "discord"
    "ghostty"
    "openclaw"
    "podman-desktop"
    "rar"
    "slack"
    "wireshark-app"
    "iina"
    "localsend"
    "tailscale-app"
    "nikitabobko/tap/aerospace"
  ];
  # Auto deletes any brews/casks that are not specified in the configuration
  onActivation.cleanup = "zap";

  # Updates (obviously)
  onActivation.autoUpdate = true;
  onActivation.upgrade = true;
}
