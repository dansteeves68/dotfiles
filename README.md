# Dan's macOS Dotfiles

Thanks to [nix-darwin](https://github.com/LnL7/nix-darwin), many things are in one file.

## Nix, Nix Darwin, and Home Manager

After installing nix, nix-darwin, and homebrew, link this file to manage everything.

`ln -s ~/dotfiles/darwin-configuration.nix ~/.nixpkgs/darwin-configuration.nix`

To build and switch:

```shell
darwin-rebuild switch
```

## Flakes

To build and switch:

```shell
nix build .#darwinConfigurations.stolen.system
./result/sw/bin/darwin-rebuild switch --flake .#stolen
```

## Alfred

After homebrew installs Alfred, open Alfred, enter license powerpack, then use Settings -> Advanced -> Set preferences folder... to point at `~/dotfiles/Alfred/`.

## iTerm2

After installing iTerm2 (via homebrew via nix-darwin) use the Preferences -> General -> Preferences dialog to point the configuration at `~/dotfiles/iTerm2/`.

(I do not use the iTerm2 password features, but if I did would they be in there?)

## Sublime Text

After installing Sublime Text (via homebrew via nix-darwin) link the user packages and settings to the directory here:


```
cd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/
rm -r User
ln -s ~/dotfiles/Sublime/User
```

## Todo

- Oh-my-zsh prompt - want two lines with date/time
