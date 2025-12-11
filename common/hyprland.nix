{ config, pkgs, ... }: {
  programs.hyprland = {
    enable = true;
    withUWSM = true; # recommended for most users
    xwayland.enable = true; # Xwayland can be disabled.
    # nvidiaPatches = true; # Obsolete
  };

  # Desktop portal
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  environment.sessionVariables = {
    # If your cursor becomes invisible
    # WLR_NO_HARDWARE_CURSORS = "1";

    # Hint electron apps to use wayland
    NIXOS_OZONE_WL = "1";
  };

  environment.systemPackages = with pkgs; [
    # Default terminal, can be removed once config is set to preference
    kitty

    # Dependency for dunst and mako
    libnotify

    # Notification daemon (one is required)
    dunst
    # mako # Users say this is dunst but with more options

    # Taskbar
    waybar

    rofi-wayland
  ];
}
