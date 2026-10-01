{ ... }:
{
  flake.nixosModules.android = { pkgs, config, ... }: {
    # configuration.nix
    nixpkgs.config.allowUnfree = true;
    environment.systemPackages = [ pkgs.android-studio ];

    # needed for the emulator's hardware acceleration
    users.users.${config.username}.extraGroups = [ "kvm" ];
  };
}
