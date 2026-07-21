{ pkgs, inputs, ... }:

{
  imports = [
    ./packages.nix
    ./modules/aerospace
  ];

  nixpkgs.config.allowUnfree = true;

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
