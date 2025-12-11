{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    prismlauncher
    xivlauncher
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };
}
