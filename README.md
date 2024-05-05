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

### Kitty

I tried using home manager `programs.kitty` but was not able to get it launchable from Alfred. :(.

For now just link to the config file `ln -s ~/.config/kitty ~/dotfiles/kitty`.

Reminder: Edit config in kitty using Command-, and reload the config after using Ctrl-Cmd-,

### Helix

Using helix from pkgs, but config via `ln -s ~/.config/helix ~/dotfiles/helix`. Mostly because for now
I don't want the hassle of rebuilding as I build this out. Maybe move to nix params later.

### Moom

Todo: Add link for preferences folder?

## More Preferences and Setup

Create folder `mkdir ~/Screenshots`

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
- Documentation for darwin options like home manager `man 5 configuration.nix`?
- Done-ish: Kitty configuration in nix
- Helix configuration in nix
- Kitty/Helix font
- Done: Test mac options like autohide dock
- Can I add Logitech options from brew?

