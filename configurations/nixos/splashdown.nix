{ flake, pkgs, ... }:
let
  inherit (flake) inputs;
  inherit (inputs) self;
in
{
  imports = [
    self.nixosModules.default
#    self.nixosModules.signal
  ];
  
  nixpkgs.hostPlatform = "x86_64-linux";

  networking.hostName = "splashdown";

  users.users.shaver.home = "/home/shaver";
  home-manager = {
    backupFileExtension = "hmbckp";
    users.shaver = {
      imports = [ (self + /configurations/home/shaver.nix) ]
    };
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.meslo-lg
  ];
};

