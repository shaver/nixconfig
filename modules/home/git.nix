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
        push.autoSetupRemote = "true";
        branch.autoSetupRebase = "always";
        push.default = "current";
        pull.rebase = "true";
        url."git@github.com:fastly".insteadOf = "https://github.com/fastly";
        url."git@github.com:signalsciences".insteadOf = "https://github.com/signalsciences";
      };
      includes = [{
        condition = "gitdir:~/src/**";
        contents = {
          user.email = "mike.shaver@fastly.com";
        };
      }];
    };
    lazygit.enable = true;
  };
}
