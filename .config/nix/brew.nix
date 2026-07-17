{
  enable = true;
  enableFishIntegration = true;
  brews = [
    "pinentry-mac"
    "sevenzip"
  ];
  casks = [
    "TheBoredTeam/boring-notch/boring-notch"
    "darrylmorley/whatcable/whatcable"
    "jordanbaird-ice"
    "podman-desktop"
    "tailscale-app"
    "wireshark-app"
    "superwhisper"
    "copilot-cli"
    "tunnelblick"
    "presentify"
    "appcleaner"
    "localsend"
    "wallspace"
    "moonlight"
    "rustdesk"
    "cotypist"
    "openclaw"
    "tigervnc"
    "element"
    "aldente"
    "vesktop"
    "ghostty"
    "cursor"
    "bruno"
    "slack"
    "yoink"
    "iina"
    "rar"
  ];
  # Auto deletes any brews/casks that are not specified in the configuration
  onActivation.cleanup = "zap";

  # Updates (obviously)
  onActivation.autoUpdate = true;
  onActivation.upgrade = true;
}
