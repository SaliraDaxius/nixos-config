{ pkgs, inputs, nix-minecraft, ... }:
{
  imports = [nix-minecraft.nixosModules.minecraft-servers];
  nixpkgs.overlays = [nix-minecraft.overlay];

  programs.tmux = {
    enable = true;
  };
  
  services.minecraft-servers = {
    enable = true;
    eula = true;

    servers = {
      analogous-test = {
        enable = true;
        package = pkgs.vanillaServers.vanilla-1_20_1;
        openFirewall = true;

        serverProperties = {
          server-port = 25565;
          enforce-secure-profile=false;
          motd = "orple";
          white-list = true;
          simulation-distance = 10;
          gamemode = "survival";
          difficulty = "normal";
        };
      };
    };
  };
  
}