{
  pkgs,
  flake,
  ...
}:
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
      go
      python3
      luarocks
      tree-sitter
      imagemagick
      tectonic
      ghostscript
      mermaid-cli
      statix
      cargo
    ];
  };

  # use the "raw" nvim config from this repo
  xdg.configFile = flake.lib.mk-out-of-store-config "nvim";
}
