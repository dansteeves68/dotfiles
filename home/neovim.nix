{ config, pkgs, lib, ... }:

{
  programs.neovim = {
    enable = true;
    # package = "pkgs.neovim-unwrapped"; # default is neovim-unwrapped
    # coc = {
    # enable = true; package = "pkgs.vimPlugins.coc-nvim"; pluginConfig = ""; settings = {};
    # };
    # extraConfig = "";
    # extraLuaPackages = [];
    # extraPackages = [];
    # generatedConfigs = {};
    plugins = with pkgs.vimPlugins; [
      lush-nvim
      nvim-treesitter
      python-syntax
      tabular
      telescope-nvim
      vim-commentary
      vim-eunuch
      vim-haskell-module-name
      vim-lastplace
      vim-nix
      vim-surround
    ];
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };
}

  # programs.neovim.extraPackages = with pkgs; [
  #   neovim-remote

  #   # Language servers, linters, etc.
  #   # See `../configs/nvim/lua/malo/nvim-lspconfig.lua` and
  #   # `../configs/nvim/lua/malo/null-ls-nvim.lua` for configuration.
  #   ccls
  #   deadnix
  #   nodePackages.bash-language-server
  #   nodePackages.typescript-language-server
  #   nodePackages.vim-language-server
  #   nodePackages.vscode-langservers-extracted
  #   nodePackages.yaml-language-server
  #   proselint
  #   rnix-lsp
  #   shellcheck
  #   statix
  #   sumneko-lua-language-server
  # ];
