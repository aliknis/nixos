{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable"; # Unstable channel

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    preservation = {
      url = "github:nix-community/preservation";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs:
    let
      # This helper function takes all the inputs we need for a host
      mkHost =
        { hostname, username }:
        inputs.nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs hostname username; };
          modules = [
            inputs.home-manager.nixosModules.home-manager
            inputs.disko.nixosModules.disko
            # inputs.preservation.nixosModules.preservation
            inputs.preservation.nixosModules.default

            # Host configuration.nix
            ./hosts/${hostname}/configuration.nix

            {
              home-manager = {
                extraSpecialArgs = { inherit inputs hostname username; };
                useGlobalPkgs = true;
                useUserPackages = true;
                users.${username} = import ./users/${username}/home.nix;
              };
              system.stateVersion = "26.11"; # Did you read the comment?
            }
          ];
        };
    in
    {
      nixosConfigurations = {
        asus = mkHost {
          hostname = "asus";
          username = "aliknis";
        };

        hp = mkHost {
          hostname = "hp";
          username = "aliknis";
        };
      };
    };
}
