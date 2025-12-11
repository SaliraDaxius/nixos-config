{ ... }: {
  networking.hostName = "theseus";
  zramSwap.enable = true;
  hardware.bluetooth.enable = true;
}
