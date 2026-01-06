{ ... }: {
  imports = [
    ./hardware-configuration.nix
    ./nvidia.nix
    ./config.nix
    ./vr.nix
    ./server.nix
  ];
}
