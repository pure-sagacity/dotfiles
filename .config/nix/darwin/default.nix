{ pkgs, ... }:

{
  system.stateVersion = 5;

  system.defaults = {
    dock.autohide = false;
    finder.AppleShowAllExtensions = true;
    NSGlobalDomain.AppleShowAllExtensions = true;
  };

  # system packages (rarely needed here)
  environment.systemPackages = with pkgs; [
    git
  ];

  # Homebrew bridge (optional but realistic)
  homebrew = {
    enable = true;

    brews = [
      "mas"   # Mac App Store CLI
    ];

    casks = [
        "copilot-cli"
        "discord"
        "ghostty"
        "kid3"
        "openclaw"
        "podman-desktop"
        "rar"
        "slack"
        "warp"
        "wireshark-app"
    ];
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}