{ ... }:
{
  flake.nixosModules.syncthing = { config, ... }: {

    services.syncthing = {
      enable = true;
      user = "${config.username}";
      dataDir = "${config.username}";
      configDir = "/home/${config.username}/.config/syncthing";
      settings = {
        devices."phone".id = "J4E2AO3-GC5QAAV-UESFG4F-ROM72DE-U5MP6DQ-TEHNT2M-4UBG6QD-DR4THA3";
        folders = {
          "Secrets" = {
            path = "/home/${config.username}/Secrets";
            devices = [ "phone" ];
            versioning.type = "simple";
            versioning.params.keep = "10"; # keep last 10 versions per file
          };
          "nixos" = {
            path = "/home/${config.username}/nixos";
            devices = [ "phone" ];
            versioning.type = "simple";
            versioning.params.keep = "10"; # keep last 10 versions per file
          };
        };
      };
    };
  };
}
