{ config, pkgs, nixpkgs-unstable, ... }:
let
  unstable = import nixpkgs-unstable {
    system = pkgs.system;
    config = config.nixpkgs.config;
  };
in
{
  environment.systemPackages = with pkgs; [
    # prismlauncher
    xivlauncher
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  home-manager = {
    users.salira = {
      home.packages = with pkgs; [
        unstable.prismlauncher
      ];
    };
  };
}
