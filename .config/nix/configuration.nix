{ pkgs, inputs, ... }:
let
  system = pkgs.stdenv.hostPlatform.system;
in
{
  environment.systemPackages = with pkgs; [
    pay-respects
    mosh
    doggo
    nixfmt
    nixfmt-tree
    fzf
    bat
    devenv
    carapace
    cmake
    cmatrix
    podman
    podman-compose
    eza
    fastfetch
    fd
    ffmpeg
    fish
    gcc
    gnupg
    kubernetes-helm
    helmfile
    kubectl
    lima
    minikube
    nasm
    neovim
    ninja
    nodejs
    openssh
    openssl
    qemu
    ripgrep
    rustup
    sqlite
    starship
    stow
    tmux
    unzip
    wakeonlan
    wget
    xh
    xz
    yazi
    yt-dlp
    zoxide
    caddy
    nixd
    doppler
    tea
    jujutsu
    pass
    secretspec

    inputs.silicate.packages.${system}.default
    inputs.herdr.packages.${system}.default
    inputs.clonee.packages.${system}.default
    inputs.fast.packages.${system}.default
  ];

  nixpkgs.config.allowUnfree = true;

  services.aerospace = {
    enable = true;
    settings = {
      mode.main.binding = {
        alt-slash = "layout tiles horizontal vertical";
        alt-comma = "layout accordion horizontal vertical";
        alt-h = "focus left";
        alt-j = "focus down";
        alt-k = "focus up";
        alt-l = "focus right";

        alt-shift-h = "move left";
        alt-shift-j = "move down";
        alt-shift-k = "move up";
        alt-shift-l = "move right";

        alt-minus = "resize smart -50";
        alt-equal = "resize smart +50";

        alt-1 = "workspace 1";
        alt-2 = "workspace 2";
        alt-3 = "workspace 3";
        alt-4 = "workspace 4";
        alt-5 = "workspace 5";

        alt-shift-1 = "move-node-to-workspace 1";
        alt-shift-2 = "move-node-to-workspace 2";
        alt-shift-3 = "move-node-to-workspace 3";
        alt-shift-4 = "move-node-to-workspace 4";
        alt-shift-5 = "move-node-to-workspace 5";

        alt-tab = "workspace-back-and-forth";
        alt-shift-tab = "move-workspace-to-monitor --wrap-around next";

        alt-shift-semicolon = "mode service";
      };
      gaps = {
        inner.horizontal = 5;
        inner.vertical = 5;
        outer.left = 5;
        outer.bottom = 5;
        outer.top = 5;
        outer.right = 5;
      };
      on-window-detected = [
        {
          "if".app-id = "com.mitchellh.ghostty";
          run = [ "layout tiles" ];
        }
      ];
      enable-normalization-flatten-containers = true;
      enable-normalization-opposite-orientation-for-nested-containers = true;
      accordion-padding = 30;
      default-root-container-layout = "tiles";
    };
  };

  services.tailscale = {
    enable = true;
  };

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  programs.fish.enable = true;
  users.users.Maaz.shell = pkgs.fish;

  nix = {
    gc = {
      automatic = true;
      interval = {
        Hour = 3;
        Minute = 15;
        Weekday = 7;
      };
      options = "--delete-older-than 7d";

    };

    settings = {
      experimental-features = "nix-command flakes";

      trusted-users = [
        "root"
        "Maaz"
      ];
      auto-optimise-store = true;
    };
  };

  system.stateVersion = 6;

  security.pam.services.sudo_local = {
    touchIdAuth = true;
    reattach = true;
  };

  system.primaryUser = "Maaz";

  system.defaults = {
    dock = {
      autohide = true;
      autohide-delay = 0.01;
      autohide-time-modifier = 0.01;
      enable-spring-load-actions-on-all-items = true;
      appswitcher-all-displays = true;
      expose-animation-duration = 0.3;
      magnification = true;
      largesize = 70;
      mineffect = "genie";
      minimize-to-application = false;
      orientation = "bottom";
      persistent-apps = [
        "/System/Applications/Apps.app"
        "/Applications/Ghostty.app"
        "/Applications/Brave Browser.app"
        "/Applications/Visual Studio Code - Insiders.app"
      ];
    };
    finder = {
      FXPreferredViewStyle = "clmv";
      FXEnableExtensionChangeWarning = false;
      ShowPathbar = true;
      ShowStatusBar = true;
    };
    iCal = {
      "first day of week" = "Sunday";
    };
    loginwindow = {
      GuestEnabled = false;
      DisableConsoleAccess = true;
    };
    menuExtraClock = {
      Show24Hour = true;
      FlashDateSeparators = false;
    };
    trackpad = {
      TrackpadRightClick = true;
      TrackpadRotate = true;
      Clicking = true;
    };
    NSGlobalDomain.AppleICUForce24HourTime = true;
    screencapture.location = "~/Downloads/Screenshots";
  };

  time.timeZone = "America/Chicago";

  homebrew = import ./brew.nix;

  nixpkgs.hostPlatform = "aarch64-darwin";
}
