{
  description = "Maaz Macbook Darwin";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    herdr = {
      url = "github:ogulcancelik/herdr";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    fast = {
      url = "github:GitanElyon/fast";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    silicate = {
      url = "github:pure-sagacity/silicate";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    clonee = {
      url = "git+https://gitea.maariz.org/pure_sagacity/clonee";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nix-homebrew,
    }:
    {
      darwinConfigurations."MacBook-Pro" = nix-darwin.lib.darwinSystem {
        specialArgs = { inherit inputs; };

        modules = [
          ./configuration.nix
          {
            system.configurationRevision = self.rev or self.dirtyRev or null;
          }

          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              enableRosetta = true;
              user = "Maaz";

              autoMigrate = true;
            };
          }
        ];
      };
    };
}
