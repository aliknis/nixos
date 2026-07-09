{
  fileSystems."/nix".neededForBoot = true;
  fileSystems."/persistent".neededForBoot = true; # sometimes needed too

  disko.devices = {

    nodev = {
      "/" = {
        fsType = "tmpfs";
        mountOptions = [
          "size=25%"
          "mode=755"
        ];
      };
    };

    disk.main = {
      device = "/dev/nvme0n1"; # MAKE SURE TOO SELECT CORRECT DISK HERE
      type = "disk";

      content = {
        type = "gpt";
        partitions = {

          boot = {
            name = "boot";
            size = "1M";
            type = "EF02";
          };

          esp = {
            name = "ESP";
            size = "1G";
            type = "EF00";

            content = {
              type = "filesystem";

              format = "vfat";
              mountpoint = "/boot";
              mountOptions = [ "umask=0077" ];
            };
          };

          luks = {
            size = "100%";
            content = {
              type = "luks";
              name = "luksCrypted";
              settings = {
                allowDiscards = true;
              };
              content = {
                type = "lvm_pv";
                vg = "vg0";
              };
            };
          };

        };
      };
    };

    lvm_vg = {
      vg0 = {
        type = "lvm_vg";
        lvs = {
          # Chosen to name this partition as state because it stores state and naming it root is misleading
          state = {
            size = "400G";
            content = {
              type = "btrfs";
              extraArgs = [ "-f" ]; # explain this flag

              subvolumes = {
                "/persistent" = {
                  mountOptions = [
                    "compress=zstd"
                    "noatime"
                  ];
                  mountpoint = "/persistent";
                };

                "/nix" = {
                  mountOptions = [
                    "compress=zstd"
                    "noatime"
                  ];
                  mountpoint = "/nix";
                };
              };
            };
          };
          swap = {
            size = "24G";
            content = {
              type = "swap";
              discardPolicy = "both";
              resumeDevice = true; # resume from hiberation from this device
            };
          };
          # raw = {
          #   size = "64G";
          # };
        };
      };

    };
  };
}
