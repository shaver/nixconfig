{ flake, pkgs, lib, ... }:
let
  inherit (flake) inputs;
  inherit (inputs) self;
in
{
  imports = [
    self.homeModules.default
  ];
  home.username = "shaver";
  home.homeDirectory = lib.mkDefault "/${if pkgs.stdenv.isDarwin then "Users" else "home"}/shaver";
  home.stateVersion = "24.11";
}
