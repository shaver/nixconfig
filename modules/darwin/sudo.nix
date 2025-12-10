# nopasswd for shaver
{ flake, pkgs, lib, ... }:

{
  security = {
    sudo.extraConfig = ''
      shaver ALL=(ALL) NOPASSWD: SETENV: ALL
    '';
  };
}
