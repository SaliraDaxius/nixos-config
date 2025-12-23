{ ... }:
{
  home-manager = {
    backupFileExtension = "backup";
    overwriteBackup = true;
    useGlobalPkgs = true;
    useUserPackages = true;

    users.salira = {
      home.stateVersion = "25.11";

      programs = {
        alacritty.enable = true;
      };
    };
  };
}
