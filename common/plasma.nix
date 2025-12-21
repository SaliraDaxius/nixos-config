{ config, pkgs, ... }: {
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
}
