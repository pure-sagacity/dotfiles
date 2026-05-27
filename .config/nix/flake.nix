{
  description = "Maaz Macbook Darwin";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    configuration = { pkgs, ... }: {
      environment.systemPackages = with pkgs; [
        vim
        pay-respects
      ];

      nix.settings.experimental-features = "nix-command flakes";

      programs.fish.enable = true;

      system.configurationRevision = self.rev or self.dirtyRev or null;

      system.stateVersion = 6;

      security.pam.services.sudo_local = {
        touchIdAuth = true;
	      reattach = true;
      };

      system.primaryUser = "Maaz";

      system.defaults = {
        dock = {
          autohide = false;
          enable-spring-load-actions-on-all-items = true;
          appswitcher-all-displays = true;
          expose-animation-duration = 0.3;
          magnification = true;
          largesize = 70;
          mineffect = "genie";
          minimize-to-application = false;
          orientation = "bottom";
        };
        screencapture.location = "~/Downloads/Screenshots";
      };

      homebrew = import ./brew.nix;

      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    darwinConfigurations."MacBook-Pro" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };
  };
}
