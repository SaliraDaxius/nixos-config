{ config, pkgs, ... }: {
  programs.hyprland = {
    enable = true;
    withUWSM = true; # recommended for most users
    xwayland.enable = true; # Xwayland can be disabled.
  };

  environment.systemPackages = with pkgs; [
    # Default terminal, can be removed once config is set to preference
    kitty

    # Dependency for dunst and mako
    libnotify

    # Notification daemon (one is required)
    dunst
    # mako # Users say this is dunst but with more options

    # Desktop portal
    xdg.portal.enable = true;
    xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  ];
}
