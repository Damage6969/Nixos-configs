{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixos-hardware }@inputs: {
    # replace nixosConfigurations.Damage with nixosConfigurations.hostname

    nixosConfigurations.Damage = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs;};
      modules = [
        ./Damage/configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
#          home-manager.users.john = import ./home.nix;
        }
      ];
    };


    nixosConfigurations.Morpheus = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs;};
      modules = [
        ./Morpheus/configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
#          home-manager.users.john = import ./home.nix;
        }
      ];
    };

    nixosConfigurations.Home = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs;};
      modules = [
        ./Home/configuration.nix
        home-manager.nixosModules.home-manager
        nixos-hardware.nixosModules.intel-nuc-8i7beh
        nixos-hardware.nixosModules.common-gpu-intel
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
#          home-manager.users.john = import ./home.nix;
        }
      ];
    };

    nixosConfigurations.Neo = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs;};
      modules = [
        ./Neo/configuration.nix
        home-manager.nixosModules.home-manager
        nixos-hardware.nixosModules.raspberry-pi-4
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
#          home-manager.users.john = import ./home.nix;
        }
      ];
    };

  };
}
