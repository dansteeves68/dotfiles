# Dan's macOS Dotfiles

Thanks to [nix-darwin](https://github.com/LnL7/nix-darwin), many things are in one file.

## Bootstrap New Machine

- Generate ssh key
- Login to 1password web
- Add ssh key to GitHub
- Clone dot files (wait for installation of developer tools)
- Install nix
- Install homebrew
- Build dot files
  + `nix build ".#darwinConfigurations.stolen.system" --extra-experimental-features nix-command --extra-experimental-features flakes`
- Rebuild
  + `./result/sw/bin/darwin-rebuild switch --flake ".#stolen"`

## Set up applications

### 1Password

Launch, login, install Safari extension, follow instructions. Set "Open Quick Access" to Hyper-1.

### Alfred

Launch, enter license powerpack, grant permissions. Then use Settings -> Advanced -> Set preferences folder... to point at `~/dotfiles/Alfred/`.

### iTerm2

Use the Preferences -> General -> Preferences dialog to point the configuration at `~/dotfiles/iTerm2/`.

(I do not use the iTerm2 password features, but if I did would they be in there?)

### Sublime Text

After installing Sublime Text (via homebrew via nix-darwin) link the user packages and settings to the directory here:

```
cd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/
rm -r User
ln -s ~/dotfiles/Sublime/User
```

Todo: Add link for preferences files

### Moom

Todo: Add link for preferences folder?

## Preferences

Remove apps from dock: `m dock prune`

## Maintenance

To build and switch:

```shell
nix build ".#darwinConfigurations.stolen.system"
./result/sw/bin/darwin-rebuild switch --flake ".#stolen"
```

Note: quoting the `.#...` references required when I set up prezto.

## Todo

- Oh-my-zsh prompt - want two lines with date/time
