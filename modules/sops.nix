{ ... }:
{
  flake.nixosModules.sops = { pkgs, config, ... }: {
    # This will add secrets.yml to the nix store
    # You can avoid this by adding a string to the full path instead, i.e.
    sops.defaultSopsFile = ../secrets/secrets.yaml;
    sops.age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ]; # This will automatically import SSH keys as age keys
    # sops.age.keyFile = "/var/lib/sops-nix/key.txt"; # This is using an age key that is expected to already be in the filesystem
    # sops.age.generateKey = true; # This will generate a new key if the key specified above does not exist

    # This is the actual specification of the secrets.

    sops.secrets.root_password_hash.neededForUsers = true;
    sops.secrets.user_password_hash.neededForUsers = true;
    sops.secrets.hcloud_token.owner = "${config.username}";
    sops.secrets.grafana_secret_key.owner = "grafana";
    sops.secrets.grafana_admin_password.owner = "grafana";
    sops.secrets.wireguard_private_key.owner = null;

    environment.systemPackages = with pkgs; [
      sops
      age
      ssh-to-age
    ];
  };
}
