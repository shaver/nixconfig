{ config, ... }:
let
  nixrepo = "${config.home.homeDirectory}/nixconfig";
in
{
  flake.lib.mk-out-of-store-config = dir: {
    ${dir} = {
      source = config.lib.file.mkOutOfStoreSymlink "${nixrepo}/config/nvim";
      recursive = true;
    };
  };
}
