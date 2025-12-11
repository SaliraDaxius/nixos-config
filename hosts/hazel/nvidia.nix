{ ... }: {
  # Standard nvidia config
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia"  ];
  hardware.nvidia.open = true;

  # Prime offload bullshit
  hardware.nvidia.prime = {
    # sync.enable = true;
    offload = {
        enable = true;
        enableOffloadCmd = true;
    };

    # integrated
    intelBusId = "PCI:0:2:0";
    # amdgpuBusId = "PCI:6:0:0"

    # dedicated
    nvidiaBusId = "PCI:1:0:0";
  };
}
