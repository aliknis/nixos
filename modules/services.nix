{
  config,
  lib,
  pkgs,
  username,
  ...
}:
{
  # Disable the OpenSSH daemon
  services.openssh = {
    enable = false;
    settings = {
      PasswordAuthentication = false; # Force key-based auth
      PermitRootLogin = "no"; # Disable root login
      KbdInteractiveAuthentication = false;
    };
  };

  services.syncthing = {
    enable = true;
    user = "${username}";
    dataDir = "${username}";
    configDir = "/home/${username}/.config/syncthing";
    settings = {
      devices = {
        "phone" = {
          id = "J4E2AO3-GC5QAAV-UESFG4F-ROM72DE-U5MP6DQ-TEHNT2M-4UBG6QD-DR4THA3";
        };
      };
      folders = {
        # "DCIM" = {
        #   path = "/home/${username}/DCIM";
        #   devices = [ "phone" ];
        # };
        "Secrets" = {
          path = "/home/${username}/Secrets";
          devices = [ "phone" ];
        };
        "Documents" = {
          path = "/home/${username}/Documents";
          devices = [ "phone" ];
        };
        "Notes" = {
          path = "/home/${username}/Notes";
          devices = [ "phone" ];
        };
      };
    };
  };

  # Input Device Configuration
  services.libinput.enable = true; # Enable touchpad support (default in most desktop managers)

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable bluetooth.
  hardware.bluetooth.enable = true; # Enable Bluetooth
  services.blueman.enable = true;
}
