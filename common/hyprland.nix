{ config, pkgs, ... }: {
  programs.hyprland = {
    enable = true;
    withUWSM = true; # recommended for most users
    xwayland.enable = true; # Xwayland can be disabled.
  };

  environment.systemPackages = with pkgs; [
    kitty
    dunst
    # mako # Users say this is dunst but with more options
  ];
}
