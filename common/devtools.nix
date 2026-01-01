{ pkgs, config, ... }: {
  users.users.salira.packages = with pkgs; [
    jetbrains.idea-oss
    nil
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

  # IntelliJ needs this to build my projects.
  # TODO: Figure out the "nix way" of doing development environments for Java
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      glfw3-minecraft

      ## glfw
      libGL
      xorg.libX11
      xorg.libXcursor
      xorg.libXext
      xorg.libXrandr
      xorg.libXxf86vm
    ];
  };
}
