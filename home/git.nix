{ config, pkgs, ... }:

{
  # Git
  programs.git.enable = true;

  programs.git.extraConfig = {
    core.editor = "subl --new-window --wait";
    diff.colorMoved = "default";
    pull.rebase = true;
  };

  programs.git.ignores = [
    ".DS_Store"
  ];

  programs.git.userEmail = config.home.user-info.email;
  programs.git.userName = config.home.user-info.fullName;

  # Enhanced diffs
  programs.git.delta.enable = true;
}
