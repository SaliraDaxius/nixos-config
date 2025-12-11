{ ... }: {
  networking.hostName = "hazel";
  zramSwap.enable = true;
  hardware.bluetooth.enable = true;
}
