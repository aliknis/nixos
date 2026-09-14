{ ... }:
{
  flake.nixosModules.vmGuest = { ... }: {
    services.qemuGuest.enable = true;

    # used when running the vm via ❯ nix run ~/nixos#nixosConfigurations.vm.config.system.build.vm
    # otherwise the defaults are 1G Ram, 1G Disk and 1 CPU core
    virtualisation.vmVariant.virtualisation.memorySize = 8192;
    virtualisation.vmVariant.virtualisation.cores = 4;
    virtualisation.vmVariant.virtualisation.diskSize = 40960;
  };
}
