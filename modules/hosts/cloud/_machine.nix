{ pkgs, inputs, ... }:
{
  hostname = builtins.baseNameOf ./.;
  username = "alice";

  imports = [ inputs.self.nixosModules.system ];

  boot.loader.grub.efiSupport = true;
  boot.loader.grub.efiInstallAsRemovable = true;

  services.openssh.enable = true;

  environment.systemPackages = [
    pkgs.curl
    pkgs.gitMinimal
  ];

  users.mutableUsers = false;
  users.users.alice = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    hashedPassword = "$y$j9T$xSJCj.SHBq5geWApylNyj0$FBC99L7JfjajiqvDBWkt5gcOHVwUZhGte90ZB0bKg.0";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKsecA8XcV40ba74VP7P1aV5qx3dJRAZbtV3GTrEg/9l titanknis"
    ];
  };
  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKsecA8XcV40ba74VP7P1aV5qx3dJRAZbtV3GTrEg/9l titanknis"
  ];
}
