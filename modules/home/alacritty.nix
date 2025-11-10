{ config, pkgs, ... }:
let
  configRepo = "${config.home.homeDirectory}/nixconfig";
in
{
  xdg.configFile = {
    alacritty = {
      source = 
        config.lib.file.mkOutOfStoreSymlink "${configRepo}/config/alacritty";
      recursive = true;
    };
  };  
}
