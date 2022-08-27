{ config, pkgs, lib, ... }:

{
  # Neovim
  programs.neovim.enable = true;
  programs.neovim.plugins = with pkgs.vimPlugins; [
    lush-nvim
    python-syntax
    tabular
    vim-commentary
    vim-eunuch
    vim-haskell-module-name
    vim-lastplace
    vim-nix
    vim-surround
  ];

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
}
