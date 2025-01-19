{ ... }:
{
  # https://nixos.asia/en/git
  programs = {
    git = {
      enable = true;
      userName = "Mike Shaver";
      userEmail = "shaver@off.net";
      ignores = [ "*~" "*.swp" ];
      aliases = {
        ci = "commit";
      };
      extraConfig = {
        init.defaultBranch = "main";
        # pull.rebase = "false";
      };
    };
    lazygit.enable = true;
  };

}
