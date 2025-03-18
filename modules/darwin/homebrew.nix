{ pkgs, flake, ... }:
let 
  inherit (flake) config inputs;
  inherit (config) self;
in
{
  homebrew = {
    casks = [
      "discord"
      "kitty"
      "alacritty"
    ];
  };

}
