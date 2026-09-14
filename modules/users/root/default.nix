{ ... }:
{
  flake.nixosModules.root = { config, ... }: {
    users.mutableUsers = false;

    users.users.root.hashedPasswordFile = config.sops.secrets."root_password_hash".path;
    users.users.root.openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILSgBw91AfSsi5FcV4rELU8jy6ZMcf7BOOZmuUgFjG4M"
    ];
  };
}
