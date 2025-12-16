{ pkgs, config, ... }: {
  users.users.salira.packages = with pkgs; [
    jetbrains.idea-community
  ];

  home-manager = {
    users.salira = {
      programs = {
        vscode = {
          enable = true;
          package = pkgs.vscodium;
        };
      };
    };
  };
}
