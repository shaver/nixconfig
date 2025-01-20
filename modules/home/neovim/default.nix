{ flake, ... }:
{
  imports = [
    flake.inputs.nixvim.homeManagerModules.nixvim
  ];

  programs.neovim.vimAlias = true;
  programs.neovim.viAlias = true;

  programs.nixvim = import ./nixvim.nix // {
    enable = true;
  };
}
