{ config, pkgs, ... }:
let
  python-with-global-packages =
    pkgs.python3.withPackages (ps: with ps; [ pandas pytest ]);
  user = builtins.getEnv "USER";
  emailAddress =
    if user == "dan" then "dan@thesteeves.org" else "dan.steeves@thrivent.com";
in {
  # Do Not Change nix-darwin
  programs.zsh.enable = true;
  services.nix-daemon.enable = true;
  system.stateVersion = 4;
  # End Do Not Change nix-darwin

  #
  # Dan's nix-darwin
  #
  environment.shellAliases = {
    vi = "nvim";
    vim = "nvim";
  };
  environment.systemPackages = [ python-with-global-packages ];

  fonts.fontDir.enable = true;
  fonts.fonts = with pkgs; [ anonymousPro ];

  homebrew = {
    enable = true;
    casks = [
      "1password"
      "1password-cli"
      "cardhop"
      "fantastical"
      # "discord"
      "iterm2"
      "marked"
      "netnewswire"
      "sublime-text"
      "tower"
    ];
    cleanup = "none";
    # TODO masApps = { Moom = NNNN, ... };
    # mdfind kMDItemAppStoreHasReceipt=1 to list current
  };

  # networking.computerName = ;

  system.defaults.dock.autohide = true;
  system.defaults.dock.autohide-delay = "0.5";
  system.defaults.dock.autohide-time-modifier = "1.0";
  system.defaults.dock.launchanim = false;
  system.defaults.dock.mineffect = null;
  system.defaults.dock.show-process-indicators = true;
  system.defaults.dock.show-recents = false;
  system.defaults.dock.static-only = false;
  system.defaults.dock.wvous-tl-corner = 4;

  system.defaults.finder.AppleShowAllExtensions = true;
  system.defaults.finder.AppleShowAllFiles = true;
  system.defaults.finder.CreateDesktop = false; # Whether to show icons on the desktop or not.
  system.defaults.finder.ShowPathbar = true;
  system.defaults.finder.ShowStatusBar = false;
  system.defaults.finder.QuitMenuItem = true;

  system.defaults.screencapture.location = "~/Screenshots/";

  # TODO system.defaults.NSGlobalDomain.com.apple.mouse.tapBehavior = 1; ### broken in Monterey

  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToEscape = true;

  # system.nixpkgsRelease = ;

  users.users.${user} = {
    name = user;
    description = "Dan Steeves";
    home = "/Users/${user}";
  };

  #
  # Dan's Home Manager
  #
  imports = [ <home-manager/nix-darwin> ];
  home-manager.users.${user} = { pkgs, ... }: {
    home.packages = with pkgs; [ awscli2 black m-cli nixfmt pandoc ripgrep somafm-cli ];
    home.sessionPath =
      [ "/Applications/Sublime Text.app/Contents/SharedSupport/bin" ];
    home.stateVersion = "22.05";
    programs.git = {
      enable = true;
      userName = "Dan Steeves";
      userEmail = emailAddress;
    };
    programs.neovim = {
      enable = true;
      plugins = with pkgs.vimPlugins; [ python-syntax vim-lastplace vim-nix ];
    };
    programs.zsh = {
      enable = true;
      oh-my-zsh = {
        enable = true;
        plugins = [ "ripgrep" "ssh-agent" "vi-mode" ];
        theme = "amuse";
      };
    };
  };
}
