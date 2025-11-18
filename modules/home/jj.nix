{ pkgs
, lib
, config
, ...
}:
let
  configRepo = "${config.home.homeDirectory}/nixconfig";
in
{ 
  programs.jujutsu = {
      enable = true;
  };

  # use the "raw" jj config from this repo
  xdg.configFile = {
      jj = {
        source = 
          config.lib.file.mkOutOfStoreSymlink "${configRepo}/config/jj";
        recursive = true;
      };
    };
}
