{ config, pkgs, ... }:
let
  python-with-global-packages = pkgs.python3.withPackages (
    ps: with ps; [ 
      pandas
      pytest
    ]
  );
in
{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = [ python-with-global-packages ];

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = [ ];

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  # environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;

  # Create /etc/bashrc that loads the nix-darwin environment.
  programs.zsh.enable = true;  # default shell on catalina
  # programs.fish.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  # Dan's Configurations
  networking.computerName = "stolen";
  system.defaults.dock.autohide = true;
  system.defaults.dock.show-process-indicators = false;
  system.defaults.dock.show-recents = false;
  system.defaults.dock.static-only = true;
  system.defaults.finder.AppleShowAllExtensions = true;
  system.defaults.finder.ShowPathbar = true;
  # TODO system.defaults.NSGlobalDomain.com.apple.mouse.tapBehavior = 1; ### broken in Monterey
  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToEscape = true;

  # Added by Dan 2022-08-06 per Nix Darwin instructions
  homebrew = {
    enable = true;
    casks = [
      "discord"
      "iterm2"
      "marked" 
      "netnewswire" 
      "sublime-text" 
      "tower"
    ];
    cleanup = "zap";
    # TODO masApps = { Moom = NNNN, ... };
    # mdfind kMDItemAppStoreHasReceipt=1 to list current
  };

  # Added by Dan 2022-08-06 per Home Manager instructions
  imports = [ <home-manager/nix-darwin> ];
  
  users.users.dan = {
    name = "dan";
    home = "/Users/dan";
  };

  home-manager.users.dan = { pkgs, ... }: {
    home.packages = with pkgs; [ 
      awscli2
      black
      dotfiles
      inetutils
      pandoc
      python3
    ];

    home.sessionPath = [
      "/Applications/Sublime Text.app/Contents/SharedSupport/bin"
    ];

    home.stateVersion = "22.05";

    programs.git = {
      enable = true;
      userName = "Dan Steeves";
      userEmail = "dan@thesteeves.org";
    };

    programs.vim = {
      enable = true;
      plugins = with pkgs.vimPlugins; [ python-syntax vim-monokai vim-nix ];
    };

    programs.zsh = {
      enable = true;
      oh-my-zsh = {
        enable = true;
        plugins = [ "vi-mode" "ssh-agent" ];
        theme = "robbyrussell";
      };
    };
  };
}
