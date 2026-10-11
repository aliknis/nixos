{ ... }:
{
  flake.nixosModules.cyber = { pkgs, config, ... }: {

    # programs.wireshark.enable = true;
    # programs.wireshark.package = pkgs.wireshark;

    users.users.${config.username}.extraGroups = [ "wireshark" ];

    environment.systemPackages = with pkgs; [
      wireshark
      tshark
      nmap
      tcpdump
    ];
  };
}
