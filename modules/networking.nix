{ ... }:
{
  flake.nixosModules.networking = { config, ... }: {
    networking.hostName = config.hostname;
    networking.networkmanager.enable = true;

    networking.firewall.enable = true;
    networking.firewall.allowedTCPPorts = [ ];
    networking.firewall.allowedUDPPorts = [ ];

    networking.wg-quick.interfaces.wg0 = {
      address = [ "10.10.10.4/24" ];
      privateKeyFile = config.sops.secrets."wireguard_private_key".path; # see note below

      dns = [ "1.1.1.1" ];

      peers = [
        {
          publicKey = "IWIZSmrfX/CjFMUIkQsOtGfsGCLtCpR9NkI8kXmmtxw=";
          endpoint = "lab1.knisium.com:51820";
          allowedIPs = [
            # "0.0.0.0/0"
            # "10.10.10.10/24"
            "34.160.111.145/32"
            # "::/0"
          ]; # full tunnel; use "10.10.10.0/24" for VPS-only access
          persistentKeepalive = 25;
        }
        {
          publicKey = "rdosXbDiIuIFsy3dfFxYDjwvWzsFFsKNmkQNg7wBjj8=";
          endpoint = "lab2.knisium.com:51820";
          allowedIPs = [
            # "0.0.0.0/0"
            # "10.10.10.10/24"
            # "::/0"
          ]; # full tunnel; use "10.10.10.0/24" for VPS-only access
          persistentKeepalive = 25;
        }
        {
          publicKey = "BjDfL4fLgPGHPLBqMLq+lvUk/cm0HJpRcQHxZGk7zRU=";
          endpoint = "lab3.knisium.com:51820";
          allowedIPs = [
            # "0.0.0.0/0"
            # "10.10.10.10/24"
            # "::/0"
          ]; # full tunnel; use "10.10.10.0/24" for VPS-only access
          persistentKeepalive = 25;
        }
      ];
    };
  };
}
