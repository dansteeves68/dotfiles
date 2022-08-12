# Dan's macOS Dotfiles

Thanks to [nix-darwin](https://github.com/LnL7/nix-darwin), many things are in one file.

## Links

Links are managed manually for now.

`ln -s ~/dotfiles/darwin-configuration.nix ~/.nixpkgs/darwin-configuration.nix`


## Bootstrap a new Mac

After first time, this is my best guess at repeating the bootstrap.

- Install nix
- Install nix-darwin
- Install homebrew
- Clone repo into `~/dotfiles`
- Set up links

Want to avoid installing manually things that will be controlled by config. Probably could edit the original config by hand with repo contents, then run. Then use installed tools to get repo and set up links.

## Todo

- Sublime Text packages and settings
- iTerm2 settings
- Oh-my-zsh prompt - want two lines with date/time
