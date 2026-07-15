{
  enable = true;
  enableFishIntegration = true;
  brews = [
    "pinentry-mac"
    "sevenzip"
  ];
  casks = [
    "TheBoredTeam/boring-notch/boring-notch"
    "jordanbaird-ice"
    "podman-desktop"
    "tailscale-app"
    "wireshark-app"
    "superwhisper"
    "copilot-cli"
    "tunnelblick"
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
    "slack"
    "yoink"
    "iina"
    "rar"
    "presentify"
  ];
  # Auto deletes any brews/casks that are not specified in the configuration
  onActivation.cleanup = "zap";

  # Updates (obviously)
  onActivation.autoUpdate = true;
  onActivation.upgrade = true;
}
