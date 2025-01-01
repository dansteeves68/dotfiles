{ config, pkgs, ... }:

{
  programs.gh.enable = true;

  programs.git = {
    enable = true;
    extraConfig = {
      push.autoSetupRemote = true;
    };
    ignores = [ ".DS_Store" ];
    userEmail = config.home.user-info.email;
    userName = config.home.user-info.fullName;
  };
}
