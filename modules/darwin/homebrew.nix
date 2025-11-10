{ pkgs, flake, ... }:
let 
  inherit (flake) config inputs;
  inherit (config) self;
in
{
  homebrew = {
    enable = true;
    casks = [
      "alacritty"
      "discord"
      "iterm2"
      "kitty"
    ];
  };
}
