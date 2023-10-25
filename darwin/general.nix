{ pkgs, ... }:
let
  python-with-global-packages = pkgs.python3.withPackages (ps:
    with ps; [
      # for AWS assume role at work
      beautifulsoup4
      boto3
      botocore
      build
      configparser
      hvac
      moto
      pandas
      pytest
      python-lsp-server
      requests
      requests-kerberos
      urllib3
    ] ++ [ pkgs.python3Packages.databricks-cli ]);
in {
  # Apps
  # `home-manager` currently has issues adding them to `~/Applications`
  # Issue: https://github.com/nix-community/home-manager/issues/1341
  environment.systemPackages = with pkgs; [
    python-with-global-packages
    terminal-notifier
  ];

  # Fonts
  fonts.fontDir.enable = true;
  fonts.fonts = with pkgs; [ anonymousPro ];

  # nix-index - Why?
  programs.nix-index.enable = true;

  # Keyboard
  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToEscape = true;

  # Add ability to used TouchID for sudo authentication
  # security.pam.enableSudoTouchIdAuth = true;
}
