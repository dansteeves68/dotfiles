{ config, lib, ... }:

let
  inherit (lib) mkIf;
  mkIfCaskPresent = cask: mkIf (lib.any (x: x == cask) config.homebrew.casks);
  brewEnabled = config.homebrew.enable;

in {
  environment.shellInit = mkIf brewEnabled ''
    eval "$(${config.homebrew.brewPrefix}/brew shellenv)"
  '';

  homebrew.enable = true;
  homebrew.onActivation.autoUpdate = true;
  homebrew.onActivation.cleanup = "zap";
  homebrew.onActivation.upgrade = true;
  homebrew.global.brewfile = true;
  homebrew.global.lockfiles = true;

  homebrew.taps = [
    "homebrew/cask-fonts"
    "homebrew/cask-versions"
    "homebrew/services"
    "nrlquaker/createzap"
  ];

  # Prefer installing application from the Mac App Store
  #
  # Commented apps suffer continual update issue:
  # https://github.com/malob/nixpkgs/issues/9
  homebrew.masApps = {
    # "1Password for Safari" = 1569813296;
    # "Numbers" = 409203825;
    # "Pins for Pinboard" = 1547106997;
    # "1Blocker" = 1365531024;
    # "1Password" = 1333542190;
    # "Gemini 2" = 1090488118;
    # "Day One" = 1055511498;
    # Deliveries = 290986013;
    # Fantastical = 975937182;
    # Keynote = 409183694;
    # MindNode = 1289197285;
    # Pages = 409201541;
    # Patterns = 429449079;
    # Xcode = 497799835;
  };

  # If an app isn't available in the Mac App Store, or the version in the App Store has
  # limitiations, e.g., Transmit, install the Homebrew Cask.
  homebrew.casks = [
    "1password"
    "alfred"
    "cardhop"
    "fantastical"
    "kitty"
    "marked"
    "moom"
    "netnewswire"
    "omnigraffle"
    "opencore-patcher"
    "orion"
    "soulver"
    "tower"
    # "transmit"
    "zoom"
    # "visual-studio-code"
    # "vlc"
  ] ++ (if config.networking.computerName == "stolen" then
    [ "discord" ]
  else
    [ ]);


  # For cli packages that aren't currently available for macOS in `nixpkgs`.Packages should be
  # installed in `../home/default.nix` whenever possible.
  homebrew.brews = [ 
    # "astro" 
  ];
}
