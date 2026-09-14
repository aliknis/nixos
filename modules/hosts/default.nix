{ inputs, lib, ... }:
let
  hosts = lib.filterAttrs (_: type: type == "directory") (builtins.readDir ./.);

  mkHost =
    hostname:
    inputs.nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        inputs.disko.nixosModules.disko
        inputs.preservation.nixosModules.preservation
        inputs.sops-nix.nixosModules.sops
        inputs.home-manager.nixosModules.home-manager

        ./${hostname}/_hardware.nix
        ./${hostname}/_machine.nix
        {
          options.username = lib.mkOption { type = lib.types.str; };
          options.hostname = lib.mkOption { type = lib.types.str; };
        }
        { system.stateVersion = "26.11"; }
      ]
      ++ lib.optional (builtins.pathExists ./${hostname}/_disko.nix) ./${hostname}/_disko.nix;
    };
in
{
  flake.nixosConfigurations = lib.mapAttrs (hostname: _: mkHost hostname) hosts;
}
