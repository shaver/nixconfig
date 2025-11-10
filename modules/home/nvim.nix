{ pkgs
, lib
, config
, ...
}:
let
  configRepo = "${config.home.homeDirectory}/nixconfig";
in
{ 
    programs.neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      withNodeJs = true;
      withPython3 = true;
  };

  # use the "raw" nvim config from this repo
  xdg.configFile = {
      nvim = {
        source = 
          config.lib.file.mkOutOfStoreSymlink "${configRepo}/config/nvim";
        recursive = true;
      };
    };
}
