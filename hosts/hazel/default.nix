{ ... }: {
  imports = [
    ./hardware-configuration.nix
    ./nvidia.nix
    ./config.nix
  ];
}
