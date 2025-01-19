# same between NixOS and Darwin; wish I could put it in .../modules/common/ but hey
{
  imports = [
    ./common/sudo.nix
  ];
}
