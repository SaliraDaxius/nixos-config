{ config, pkgs, plasma-manager, ... }: {
  services = {
    xserver.enable = true;
    desktopManager.plasma6.enable = true;
    displayManager = {
      sddm = {
        enable = true;
        autoNumlock = true;
        wayland.enable = true;
      };
    };
  };

  users.users.salira.packages = with pkgs; [
    kdePackages.kalarm
  ];

  home-manager = {
    sharedModules = [ plasma-manager.homeModules.plasma-manager ];

    users.salira = { pkgs, ...}: {
      programs.plasma = {
        enable = true;
        # overrideConfig = true;

        workspace = {
          theme = "Breeze Dark";
          colorScheme = "BreezeDark";
          iconTheme = "breeze-dark";
        };

        kwin = {
          effects = {
            blur.enable = true;
            translucency.enable = true;
          };
        };

        fonts = {
          fixedWidth = {
            family = "Monocraft";
            pointSize = 10;
          };
        };
      };
    };
  };
}
