{ pkgs, ... }:
{
  # Nix packages to install to $HOME
  #
  # Search for packages here: https://search.nixos.org/packages
  home.packages = with pkgs; [
    # Unix tools
    ripgrep # Better `grep`
    fd
    sd
    tree
    gnumake

    # Nix dev
    cachix
    nil # Nix language server
    nix-info
    nixpkgs-fmt
    nixfmt-rfc-style

    jq
    curl
    coreutils

    # On ubuntu, we need this less for `man home-configuration.nix`'s pager to
    # work.
    less

    go

    fastly
  ];

  # Programs natively supported by home-manager.
  # They can be configured in `programs.*` instead of using home.packages.
  programs = {
    # Better `cat`
    bat.enable = true;
    # Type `<ctrl> + r` to fuzzy search your shell history
    fzf = {
      enable = true;
      tmux.enableShellIntegration = true;
    };
    jq.enable = true;
    # Install btop https://github.com/aristocratos/btop
    btop.enable = true;
    irssi = {
      enable = true;
      networks.sizone = {
        server = {
          address = "irc.sizone.org";
          autoConnect = true;
        };
        nick = "shaver";
        channels."#tek".autoJoin = true;
      };
    };
    tmux = {
      enable = true;
      shortcut = "a";
    };
    jujutsu = {
      # `jj`
      enable = true;
      ediff = true;
    };
    nh = {
      enable = true;
      clean.enable = true;
      flake = "/Users/shaver/nixconfig"; # default flake for `os switch` etc.
    };
    htop.enable = true;
    gh = {
      enable = true;
      settings.git_protocol = "https";
      settings.extensions = [ "yusukebe/gh-markdown-preview" ];
    };
    gh-dash.enable = true;

  };
}
