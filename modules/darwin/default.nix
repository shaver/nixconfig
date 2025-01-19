# This is your nix-darwin configuration.
# For home configuration, see /modules/home/*
{ flake, pkgs, lib, ... }:

let
  inherit (flake) inputs;
  inherit (inputs) self;
in
{
  imports = [
    self.nixosModules.common
  ];

  security = {
    pam.enableSudoTouchIdAuth = true; # Use TouchID for `sudo` authentication
  };

  # These users can add Nix caches.
  nix.settings.trusted-users = [ "root" "shaver" ];

  environment = {
    systemPackages = with pkgs; [
      pam-watchid
    ];
    shells = [ pkgs.zsh ];
  };

  # Configure macOS system
  # More examples => https://github.com/ryan4yin/nix-darwin-kickstarter/blob/main/rich-demo/modules/system.nix
  system = {
    defaults = {
      dock = {
        autohide = true;
        expose-group-apps = true; # group apps in Exposé
        magnification = true; # magnify icon on hover
        mru-spaces = false; # don't rearrange spaces based on use
        # customize Hot Corners
        # wvous-tl-corner = 2; # top-left - Mission Control
        # wvous-tr-corner = 13; # top-right - Lock Screen
        # wvous-bl-corner = 3; # bottom-left - Application Windows
        # wvous-br-corner = 4; # bottom-right - Desktop
      };

      finder = {
        _FXShowPosixPathInTitle = true; # show full path in finder title
        AppleShowAllExtensions = true; # show all file extensions
        AppleShowAllFiles = true; # show hidden files
        FXEnableExtensionChangeWarning = false; # disable warning when changing file extension
        NewWindowTarget = "Home"; # default Finder window folder
        FXPreferredViewStyle = "clmv"; # default to column view
        QuitMenuItem = true; # enable quit menu item
        ShowPathbar = true; # show path bar
        ShowStatusBar = true; # show status bar
      };

      CustomUserPreferences = {
        #        "com.apple.Safari" = {
        #          "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" = true;
        #          "ShowFullURLInSmartSearchField" = true;
        #        };
        "com.apple.TextEdit".RichText = false; # plain text files by default

        NSGlobalDomain = {
          NSAutomaticCapitalizationEnabled = false;
          NSAutomaticSpellingCorrectionEnabled = false;
          AppleInterfaceStyleSwitchesAutomatically = true; # light/dark auto
          # swipe left/right doesn't navigate
          AppleEnableSwipeNavigateWithScrolls = false;
        };

      };

      controlcenter = {
        Display = true; # show Displays in menu bar
        FocusModes = true; # show Focus control in menu bar
        Sound = true; # show Sound control in menu bar
        BatteryShowPercentage = true; # show battery percentage
      };

      screencapture = {
        location = "/Users/shaver/Screenshots"; # save screenshot files here
        target = "clipboard"; # default screenshot to clipboard
        disable-shadow = false; # no shadow border on screenshots
        include-date = true; # date in filenames
        type = "png"; # save screenshots as PNG
      };

      spaces.spans-displays = false; # each display has a different Space

      # only in Stage Manager
      WindowManager.EnableStandardClickToShowDesktop = false;
    };

    keyboard = {
      # enableKeyMapping = true;
      # remapCapsLockToControl = true;
    };

    #    activationScripts.postActivation.text = ''
    #      echo "WatchID settings"
    #      if ! grep 'pam_watchid.so' > /dev/null; then
    #        ${pkgs.gnused}/bin/sed -i '2i\
    #      auth	sufficient	pam_watchid.so # darwin/default.nix
    #      ' /etc/pam.d/sudo
    #      fi
    #    '';

  };

  services = {
    tailscale.enable = true;
  };

  services.aerospace = {
    enable = true;
    settings = {
      mode.main.binding = {
        # See: https://nikitabobko.github.io/AeroSpace/commands#layout
        alt-slash = "layout tiles horizontal vertical";
        alt-comma = "layout accordion horizontal vertical";

        # See: https://nikitabobko.github.io/AeroSpace/commands#focus
        alt-h = "focus left";
        alt-j = "focus down";
        alt-k = "focus up";
        alt-l = "focus right";

        # See: https://nikitabobko.github.io/AeroSpace/commands#move
        alt-shift-h = "move left";
        alt-shift-j = "move down";
        alt-shift-k = "move up";
        alt-shift-l = "move right";

        # See: https://nikitabobko.github.io/AeroSpace/commands#resize
        alt-minus = "resize smart -50";
        alt-equal = "resize smart +50";

        # See: https://nikitabobko.github.io/AeroSpace/commands#workspace
        alt-1 = "workspace 1";
        alt-2 = "workspace 2";
        alt-3 = "workspace 3";
        alt-4 = "workspace 4";
        alt-5 = "workspace 5";

        # See: https://nikitabobko.github.io/AeroSpace/commands#move-node-to-workspace
        alt-shift-1 = "move-node-to-workspace 1";
        alt-shift-2 = "move-node-to-workspace 2";
        alt-shift-3 = "move-node-to-workspace 3";
        alt-shift-4 = "move-node-to-workspace 4";
        alt-shift-5 = "move-node-to-workspace 5";

        # See: https://nikitabobko.github.io/AeroSpace/commands#workspace-back-and-forth
        alt-tab = "workspace-back-and-forth";

        # See: https://nikitabobko.github.io/AeroSpace/commands#mode
        alt-shift-semicolon = "mode service";
      };

      mode.service.binding = {
        esc = [ "reload-config" "mode main" ];
        r = [ "flatten-workspace-tree" "mode main" ]; # reset layout
        f = [ "layout floating tiling" "mode main" ]; # Toggle between floating and tiling layout
        backspace = [ "close-all-windows-but-current" "mode main" ];

        # sticky is not yet supported https://github.com/nikitabobko/AeroSpace/issues/2
        #s = ["layout sticky tiling" "mode main"];

        alt-shift-h = [ "join-with left" "mode main" ];
        alt-shift-j = [ "join-with down" "mode main" ];
        alt-shift-k = [ "join-with up" "mode main" ];
        alt-shift-l = [ "join-with right" "mode main" ];

        down = "volume down";
        up = "volume up";
        shift-down = [ "volume set 0" "mode main" ];
      };
    };
  };

  programs = {
    tmux = {
      enable = true;
      enableFzf = true;
      enableMouse = true;
      enableSensible = true;
      enableVim = true;
    };
    zsh.enable = true;
    direnv.enable = true;
  };

  power = {
    restartAfterFreeze = true;
    restartAfterPowerFailure = true;
  };

  networking.wakeOnLan.enable = true;
}
