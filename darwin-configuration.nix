{ config, pkgs, ... }:

{
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

  # Added by Dan 2022-08-06
  homebrew = {
    enable = true;
    casks = [ 
      "marked" 
      "netnewswire" 
      "sublime-text" 
      "tower"
    ];
    cleanup = "zap";
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

    home.stateVersion = "22.05";

    programs.git = {
      enable = true;
      userName = "Dan Steeves";
      userEmail = "dan@thesteeves.org";
    };

    programs.vim = {
      enable = true;
      plugins = with pkgs.vimPlugins; [ neovim-sensible python-syntax vim-nix ];
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
