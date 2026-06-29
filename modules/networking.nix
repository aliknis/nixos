{
  config,
  lib,
  pkgs,
  hostname,
  ...
}:
{
  # Networking Configuration
  networking.hostName = hostname; # Set system hostname
  networking.networkmanager.enable = true; # Enable NetworkManager for easier network management

  # DNS
  # networking.nameservers = [
  #   "1.1.1.1"
  #   "1.0.0.1"
  # ]; # Mullvad standard
  # services.resolved = {
  #   enable = true;
  #   settings.Resolve = {
  #     DNSSEC = "true";
  #     DNSOverTLS = "true";
  #   };
  # };

  # Firewall Configuration
  networking.firewall = {
    enable = true;

    # Open ports in the firewall
    allowedTCPPorts = [ ];
    allowedUDPPorts = [ ];

  };
}
