{ config, lib, pkgs, ... }:
let
  inherit (lib) elem optionalString;
  inherit (config.home.user-info) nixConfigDirectory;
in {
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "ripgrep" "ssh-agent" "vi-mode" ];
      theme = "amuse";
    };
  };
}
