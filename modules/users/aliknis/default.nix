{ ... }:
let
  username = builtins.baseNameOf ./.;
in
{
  flake.nixosModules.${username} = { config, ... }: {
    users.mutableUsers = false;

    users.users.${username} = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "networkmanager"
      ];

      hashedPasswordFile = config.sops.secrets.user_password_hash.path;

      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILSgBw91AfSsi5FcV4rELU8jy6ZMcf7BOOZmuUgFjG4M"
      ];
    };

    home-manager.users.${username} = import ./_home.nix;
  };
}
