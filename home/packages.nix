{ config, lib, pkgs, ... }:

{
  # Bat, a substitute for cat.
  # https://github.com/sharkdp/bat
  # https://rycee.gitlab.io/home-manager/options.html#opt-programs.bat.enable
  programs.bat.enable = true;
  programs.bat.config = { style = "plain"; };

  # Direnv, load and unload environment variables depending on the current directory.
  # https://direnv.net
  # https://rycee.gitlab.io/home-manager/options.html#opt-programs.direnv.enable
  # programs.direnv.enable = true;
  # programs.direnv.nix-direnv.enable = true;

  # Htop
  # https://rycee.gitlab.io/home-manager/options.html#opt-programs.htop.enable
  programs.htop.enable = true;
  programs.htop.settings.show_program_path = true;

  # Zoxide, a faster way to navigate the filesystem
  # https://github.com/ajeetdsouza/zoxide
  # https://rycee.gitlab.io/home-manager/options.html#opt-programs.zoxide.enable
  programs.zoxide.enable = true;

  home.packages = with pkgs;
    [
      # Some basics
      abduco # lightweight session management
      awscli2
      bandwhich # display current network utilization by process
      black
      bottom # fancy version of `top` with ASCII graphs
      browsh # in terminal browser
      coreutils
      curl
      du-dust # fancy version of `du`
      exa # fancy version of `ls`
      fd # fancy version of `find`
      htop # fancy version of `top`
      hyperfine # benchmarking tool
      jpegoptim
      jq
      mosh # wrapper for `ssh` that better and not dropping connections
      nodePackages.speed-test # nice speed-test tool
      pandoc
      parallel # runs commands in parallel
      ripgrep
      ripgrep # better version of `grep`
      somafm-cli
      tealdeer # rust implementation of `tldr`
      thefuck
      unrar # extract RAR archives
      wget
      xz # extract XZ archives

      # Useful nix related tools
      cachix # adding/managing alternative binary caches hosted by Cachix
      comma # run software from without installing it
      niv # easy dependency management for nix projects
      nixfmt # format nix files
      nix-tree # interactively browse dependency graphs of Nix derivations
      nix-update # swiss-knife for updating nix packages
      nixpkgs-review # review pull-requests on nixpkgs
      nodePackages.node2nix
      statix # lints and suggestions for the Nix programming language

    ] ++ lib.optionals stdenv.isDarwin [
      cocoapods
      m-cli # useful macOS CLI commands
      prefmanager # tool for working with macOS defaults
    ];
}
