{ pkgs, config, ... }: {
  users.users.salira.packages = with pkgs; [
    jetbrains.idea-oss
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

  # IntelliJ needs this to build my project.
  # TODO: Figure out the "nix way" of doing development environments for Java
  programs.nix-ld.enable = true;
}
