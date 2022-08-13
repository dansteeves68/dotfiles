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
      "discord"
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
  system.defaults.dock.show-process-indicators = false;
  system.defaults.dock.show-recents = false;
  system.defaults.dock.static-only = true;

  system.defaults.finder.AppleShowAllExtensions = true;
  system.defaults.finder.ShowPathbar = true;

  # TODO system.defaults.NSGlobalDomain.com.apple.mouse.tapBehavior = 1; ### broken in Monterey

  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToEscape = true;

  users.users.${user} = {
    name = user;
    home = "/Users/${user}";
  };

  #
  # Dan's Home Manager
  #
  imports = [ <home-manager/nix-darwin> ];
  home-manager.users.${user} = { pkgs, ... }: {
    home.packages = with pkgs; [ awscli2 black nixfmt pandoc ripgrep ];
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
        theme = "robbyrussell";
      };
    };
  };
}
