{ config, pkgs, ... }:
{
  # https://nixos.asia/en/direnv
  programs.direnv = {
    nix-direnv = {
      enable = true;
    };
    # this doesn't work, see
    # https://stackoverflow.com/questions/79371917/direnv-printing-environment-diff-even-with-hide-env-diff-true/79543570#79543570
    # config.global = {
    #   # Make direnv messages less verbose
    #   hide_env_diff = true;
    # };
  };
}
