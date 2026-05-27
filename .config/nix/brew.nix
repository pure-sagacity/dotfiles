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
    "pinentry"
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
    "mas"
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
    #"hammerspoon"
  ];
  # {App Name} = {App ID}
  # Get App ID with mas search {app}
  masApps = {
    "Xcode" = 497799835;
    "Tailscale" = 1475387142;
    "Localsend" = 1661733229;
  };
  # Auto deletes any brews/casks that are not specified in the configuration
  onActivation.cleanup = "zap";
}
