{ ... }:
{
  flake.nixosModules.android = { pkgs, config, ... }: {
    # configuration.nix
    nixpkgs.config.allowUnfree = true;
    environment.systemPackages = with pkgs; [
      android-studio
      android-tools
    ];

    # needed for the emulator's hardware acceleration
    users.users.${config.username}.extraGroups = [ "kvm" ];
  };
}
