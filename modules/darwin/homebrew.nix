{ pkgs, flake, ... }:
let 
  inherit (flake) config inputs;
  inherit (config) self;
in
{
  homebrew = {
    enable = true;
    casks = [
      "discord"
      "kitty"
      "alacritty"
    ];
  };
}
