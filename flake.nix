{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs-xr.url = "github:nix-community/nixpkgs-xr";
    buttplug-lite = {
      url = "github:runtime-shady-backroom/buttplug-lite";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs: {

    nixosConfigurations = {
      theseus = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/theseus
          ./common
          inputs.home-manager.nixosModules.home-manager
          inputs.nixpkgs-xr.nixosModules.nixpkgs-xr
        ];
        specialArgs = inputs;
      };

      hazel = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/hazel
          ./common
          inputs.home-manager.nixosModules.home-manager
        ];
        specialArgs = inputs;
      };
    };
  };
}
