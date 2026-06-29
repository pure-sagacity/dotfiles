{
  enable = true;
  enableFishIntegration = true;
  brews = [
    "pinentry-mac"
    "sevenzip"
  ];
  casks = [
    "copilot-cli"
    "ghostty"
    "openclaw"
    "podman-desktop"
    "rar"
    "slack"
    "wireshark-app"
    "iina"
    "localsend"
    "tailscale-app"
    "yoink"
    "nikitabobko/tap/aerospace"
    "superwhisper"
    "wallspace"
    "moonlight"
    "vesktop"
    "tigervnc"
    "element"
  ];
  # Auto deletes any brews/casks that are not specified in the configuration
  onActivation.cleanup = "zap";

  # Updates (obviously)
  onActivation.autoUpdate = true;
  onActivation.upgrade = true;
}
