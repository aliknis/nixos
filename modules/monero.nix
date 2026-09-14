{ ... }:
{
  flake.nixosModules.monero = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      # Monero testing
      monero-cli
      monero-gui
      p2pool
      xmrig
    ];

    # For Nano mode (port 37890)
    # networking.firewall.allowedTCPPorts = [ 37890 ];
    # networking.firewall.allowedUDPPorts = [ ];

    hardware.cpu.x86.msr.enable = true; # understand this and is it needed or just run xmrig with sudo
    boot.kernel.sysctl."vm.nr_hugepages" = 2048; # 2048 * 2MiB pages = 4096 MiB = 4GiB
  };
}
