{ config, pkgs, ... }:

{
  home.username = "Maaz";
  home.homeDirectory = "/Users/Maaz";

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;

  # CLI tools (this replaces brew install formula)
  home.packages = with pkgs; [
    bat
    ca-certificates
    carapace
    cmake
    cmatrix
    podman
    podman-completion
    podman-compose
    eza
    fastfetch
    fd
    ffmpeg
    fish
    fzf
    gcc
    geode-cli
    gnupg
    helm
    imagemagick
    kubernetes-cli
    lima
    lua
    minikube
    neovim
    ninja
    node
    openssh
    pass
    pinentry
    qemu
    ripgrep
    rustup
    sevenzip
    sqlite
    starship
    stow
    stripe
    thefuck
    tmux
    unzip
    wakeonlan
    wget
    xh
    xz
    yazi
    yt-dlp
    zoxide
  ];

  programs.fish = {
    enable = true;
  };

  programs.git = {
    enable = true;
    userName = "Maaz Khokhar";
    userEmail = "khokharmaaz@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
}