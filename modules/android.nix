{ ... }:
{
  flake.nixosModules.android = { pkgs, config, ... }: {

    # Waydroid
    networking.nftables.enable = true;
    virtualisation.waydroid.enable = true;

    # Android SDK
    nixpkgs.config.allowUnfree = true;
    environment.systemPackages = with pkgs; [
      android-studio # Replaced by android-cli
      android-cli
      android-tools
    ];

    # needed for the emulator's hardware acceleration
    users.users.${config.username}.extraGroups = [ "kvm" ];
  };
}
