{
  description = "Maaz macOS Nix config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nix-darwin, home-manager, ... }:
  let
    system = "aarch64-darwin"; # change to x86_64-darwin if Intel Mac
  in {
    darwinConfigurations.mac = nix-darwin.lib.darwinSystem {
      inherit system;

      modules = [
        ./darwin/default.nix

        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.users.maaz = import ./home;
        }
      ];
    };
  };
}