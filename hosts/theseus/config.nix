{ ... }: {
  networking.hostName = "theseus";
  zramSwap.enable = true;

  /*
  # This is to fix frequent Bluetooth audio dropouts.
  boot.extraModprobeConfig = ''
    # Keep Bluetooth coexistence disabled for better BT audio stability
    options iwlwifi bt_coex_active=0

    # Enable software crypto (helps BT coexistence sometimes)
    options iwlwifi swcrypto=1

    # Disable power saving on Wi-Fi module to reduce radio state changes that might disrupt BT
    options iwlwifi power_save=0

    # Disable Unscheduled Automatic Power Save Delivery (U-APSD) to improve BT audio stability
    options iwlwifi uapsd_disable=1

    # Disable D0i3 power state to avoid problematic power transitions
    options iwlwifi d0i3_disable=1

    # Set power scheme for performance (iwlmvm)
    options iwlmvm power_scheme=1
  '';
  */

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        # Shows battery charge of connected devices on supported
        # Bluetooth adapters. Defaults to 'false'.
        Experimental = true;
        # When enabled other devices can connect faster to us, however
        # the tradeoff is increased power consumption. Defaults to
        # 'false'.
        FastConnectable = true;
      };
    };
  };
}
