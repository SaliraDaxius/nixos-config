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
        alacritty = {
	  enable = true;
	  settings = {
	    font = {
	      size = 12.0;
	      normal = {
	        family = "Monocraft";
		style = "Regular";
	      };
	      bold = {
                family = "Monocraft";
		style = "Bold";
	      };
	      italic = {
	        family = "Monocraft";
		style = "Italic";
	      };
	    };
          };
	};
      };
    };
  };
}
