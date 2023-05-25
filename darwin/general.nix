{ pkgs, ... }:
let
  python-with-global-packages = pkgs.python3.withPackages (ps:
    with ps; [
      # for AWS assume role at work
      beautifulsoup4
      boto3
      botocore
      configparser
      pandas
      pytest
      requests
      requests-kerberos
      urllib3
    ]);
in {
  # Prefer neovim to other variations
  # environment.shellAliases = {
  # vi = "nvim";
  # vim = "nvim";
  # };

  # Apps
  # `home-manager` currently has issues adding them to `~/Applications`
  # Issue: https://github.com/nix-community/home-manager/issues/1341
  environment.systemPackages = with pkgs; [
    kitty
    python-with-global-packages
    terminal-notifier
  ];
  # https://github.com/nix-community/home-manager/issues/423
  # environment.variables = {
  #   TERMINFO_DIRS = "${pkgs.kitty.terminfo.outPath}/share/terminfo";
  # };

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
