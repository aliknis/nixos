{ ... }:
{
  flake.nixosModules.vm = { config, pkgs, ... }: {
    virtualisation.libvirtd.enable = true;
    virtualisation.libvirtd.qemu.swtpm.enable = true;
    virtualisation.spiceUSBRedirection.enable = true;
    # virtualisation.libvirtd.qemu.vhostUserPackages = with pkgs; [ virtiofsd ]; # is this necessary for file sharing?

    programs.virt-manager.enable = true;

    users.users.${config.username}.extraGroups = [
      "libvirtd"
      "kvm"
    ];
    environment.sessionVariables.LIBVIRT_DEFAULT_URI = "qemu:///system";

    environment.systemPackages = with pkgs; [
      virt-viewer

      virtio-win
      win-spice
    ];
  };
}
