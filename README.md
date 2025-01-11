# Dan's macOS Dotfiles (until 2024)

Note: As of January 2025 I have moved to a simpler flake, see https://github.com/dansteeves68/nix.
If you are just starting out and you want to copy something, I suggest you start there.

Thanks to [nix-darwin](https://github.com/LnL7/nix-darwin), many things are in one file.

## Todo

- Move Moom config to dotfiles?

## Bootstrap New MacOS Machine

- Set up iCloud
- Login to 1Password web
- Login to GitHub
- Generate ssh key
- Add ssh key to GitHub
- Clone dot files (wait for installation of developer tools)
- Install nix
  - Determinate systems installer https://github.com/DeterminateSystems/nix-installer
- Install homebrew
- Build dot files
  - `nix build ".#darwinConfigurations.stolen.system"`
- Rebuild
  - `./result/sw/bin/darwin-rebuild switch --flake ".#stolen"`
- Set up links for Kitty and Helix config files
- Continue with applications setup below

## Set up applications

### Kitty

I tried using home manager `programs.kitty` but was not able to get it launchable from Alfred. :(.

For now just link to the config file `ln -s ~/dotfiles/kitty ~/.config/kitty`.

Reminder: Edit config in kitty using Command-, and reload the config after using Ctrl-Cmd-,

### Helix

Using helix from pkgs, but config via `ln -s ~/dotfiles/helix ~/.config/helix`. Mostly because for
now I don't want the hassle of rebuilding as I build this out. Maybe move to nix params later.

### 1Password

Launch, login, install Safari extension, follow instructions. Set "Open Quick Access" to Hyper-1.

### Alfred

Launch, enter license powerpack, grant permissions. Then use Settings -> Advanced -> Set preferences
folder... to point at `~/dotfiles/Alfred/`.

### Moom

Launch and set up:

- Separate windows by 4 pt and apply to screen edges
- Launch automatically on login
- Run as menu bar application
- Set Shift-Ctrl-Opt-Cmd-M as hot key
- Set up thirds and full-ish 1-4 quick sizes

License: Download and double-click license file from 1Password

### Day One

Install from Mac App Store.

## More Preferences and Setup

Create folder `mkdir ~/Screenshots`

Remove apps from dock: `m dock prune`

## Maintenance

To build and switch:

```shell
nix build ".#darwinConfigurations.stolen.system"
./result/sw/bin/darwin-rebuild switch --flake ".#stolen"
```

Note: quoting the `.#...` references required when I set up prezto. Note: enable `killall Dock` when
working on Dock preferences.

## Todo

- Oh-my-zsh prompt - want two lines with date/time
- Documentation for darwin options like home manager `man 5 configuration.nix`?
- Done-ish: Kitty configuration in nix
- Helix configuration in nix
- Kitty/Helix font
- Done: Test mac options like autohide dock
- Can I add Logitech options from brew?
