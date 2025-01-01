{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    ignores = [ ".DS_Store" ];
    userEmail = config.home.user-info.email;
    userName = config.home.user-info.fullName;
  };
}
