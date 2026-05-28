{
  description = "Maaz Macbook Darwin";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew }:
  let
    configuration = { pkgs, ... }: {
      environment.systemPackages = with pkgs; [
        neovim
        pay-respects
      ];

      fonts.packages = with pkgs; [
        nerd-fonts.jetbrains-mono
      ];

      nix.settings.experimental-features = "nix-command flakes";

      programs.fish.enable = true;
      users.users.Maaz.shell = pkgs.fish;

      system.configurationRevision = self.rev or self.dirtyRev or null;

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
          FlashDateSeparators = true;
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
    };
  in
  {
    darwinConfigurations."MacBook-Pro" = nix-darwin.lib.darwinSystem {
      modules = [
        configuration
        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            enable = true;
            # Apple Silicon Only
            enableRosetta = true;
            user = "Maaz";

            autoMigrate = true;
          };
        }
      ];
    };
  };
}
