{ ... }: {
  flake.nixosModules.preservation = { ... }: {
    # fileSystems."/etc/ssh".neededForBoot = true;
    # or this
    # sops.age.keyFile = "/nix/persist/var/lib/sops-nix/key.txt";

    boot.tmp.cleanOnBoot = true;
    systemd.suppressedSystemUnits = [ "systemd-machine-id-commit.service" ];

    systemd.tmpfiles.rules = [ "h /var/lib/libvirt - - - - +C" ]; # Disable COW for IO sensitive VMs and DBs

    preservation.enable = true;
    preservation.preserveAt."/persistent" = {
      directories = [
        "/var/lib/bluetooth"
        {
          directory = "/var/lib/nixos";
          inInitrd = true;
        }
        "/etc/NetworkManager/system-connections"
        "/var/lib/systemd/timers"
        "/var/lib/libvirt"
        # "/var/lib/jellyfin/"
      ];

      files = [
        {
          file = "/etc/machine-id";
          inInitrd = true;
        }
        {
          file = "/etc/ssh/ssh_host_rsa_key";
          how = "symlink";
          configureParent = true;
          inInitrd = true;
        }
        {
          file = "/etc/ssh/ssh_host_rsa_key.pub";
          how = "symlink";
          configureParent = true;
        }
        {
          file = "/etc/ssh/ssh_host_ed25519_key";
          how = "symlink";
          configureParent = true;
          inInitrd = true;
        }
        {
          file = "/etc/ssh/ssh_host_ed25519_key.pub";
          how = "symlink";
          configureParent = true;
        }
      ];
    };
  };
}
