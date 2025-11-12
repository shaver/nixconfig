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
      extraPackages = with pkgs; [
        python3
        luarocks
        tree-sitter
        imagemagick
        tectonic
        ghostscript
        mermaid-cli
      ];
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
