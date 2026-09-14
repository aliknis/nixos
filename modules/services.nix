{ ... }:
{
  flake.nixosModules.services = { ... }: {

    services.udisks2.enable = true;

    services.openssh = {
      enable = true;
      settings.PasswordAuthentication = false;
      settings.PermitRootLogin = "no";
      settings.KbdInteractiveAuthentication = false;
    };

    services.fail2ban.enable = true;
    # services.fail2ban.bantime = "1h"; # Ban duration
    # services.fail2ban.maxretry = 5; # Failed attempts before ban
    # services.crowdsec.enable = true;

    hardware.bluetooth.enable = true;
    services.blueman.enable = true;
    services.libinput.enable = true;

    # Printing
    services.printing.enable = true; # Enable CUPS to print ocuments.

    services.avahi.enable = true; # Enable avahi to auto discover printers(and built-in scanner)
    services.avahi.nssmdns4 = true;
    services.avahi.openFirewall = true;

    # Scanning
    hardware.sane.enable = true; # enables support for SANE scanners
  };
}
