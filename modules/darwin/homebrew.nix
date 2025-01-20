{ pkgs, inputs, nix-homebrew, homebrew-core, homebrew-cask, homebrew-bundle, ... }:

{
  nix-homebrew = {
    enable = true;
    enableRosetta = true;
    user = "shaver";
    autoMigrate = true;

    taps = {
      "homebrew/homebrew-core" = homebrew-core;
      "homebrew/homebrew-cask" = homebrew-cask;
      "homebrew/homebrew-bundle" = homebrew-bundle;
    };

    mutableTaps = false;
  };

  homebrew = {
    casks = [
      "discord"
      "kitty"
    ];
  };

}
