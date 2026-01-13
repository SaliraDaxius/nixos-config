{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs-xr.url = "github:nix-community/nixpkgs-xr";
    nix-minecraft.url = "github:Infinidoge/nix-minecraft";

    plasma-manager = {
      url = "github:pjones/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    buttplug-lite = {
      url = "github:runtime-shady-backroom/buttplug-lite";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-gaming-edge = {
      url = "github:powerofthe69/nix-gaming-edge";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    nixpkgs-xr,
    nix-gaming-edge,
    ...
  }@inputs: {

    nixosConfigurations = {
      theseus = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/theseus
          ./common
          home-manager.nixosModules.home-manager
          nixpkgs-xr.nixosModules.nixpkgs-xr
          nix-gaming-edge.nixosModules.mesa-git
        ];
        specialArgs = inputs;
      };

      hazel = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/hazel
          ./common
          home-manager.nixosModules.home-manager
        ];
        specialArgs = inputs;
      };
    };
  };
}
