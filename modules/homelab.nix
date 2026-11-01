{ ... }:
{
  flake.nixosModules.homelab = { pkgs, config, ... }: {

    # services.jellyfin.enable = true;
    # services.jellyfin.openFirewall = true;
    # services.jellyfin.group = "media";
    # users.groups.media.members = [
    #   config.username
    #   "jellyfin"
    # ];
    # systemd.tmpfiles.rules = [ "d /var/lib/jellyfin/media 2775 jellyfin media -" ];

    # environment.systemPackages = [ pkgs.jellyfin-desktop ];

    # services.immich.enable = true;
    # services.uptime-kuma.enable = true;
    # services.microbin.enable = true;

    # services.nextcloud.enable = true;

    # services.forgejo.enable = true;

    # services.prometheus = {
    #   enable = true;
    #   exporters.node = {
    #     enable = true;
    #     enabledCollectors = [ "systemd" ];
    #   };
    #   scrapeConfigs = [
    #     {
    #       job_name = "node";
    #       static_configs = [
    #         {
    #           targets = [ "127.0.0.1:${toString config.services.prometheus.exporters.node.port}" ];
    #         }
    #       ];
    #     }
    #   ];
    #   globalConfig.scrape_interval = "15s";
    # };
    #
    # services.grafana = {
    #   enable = true;
    #   settings.server = {
    #     http_addr = "127.0.0.1"; # laptop-local only, for now
    #     http_port = 3000;
    #   };
    #   settings.security.secret_key = "$__file{${config.sops.secrets.grafana_secret_key.path}}";
    #   settings.security.admin_user = "admin"; # optional, defaults to "admin"
    #   settings.security.admin_password = "$__file{${config.sops.secrets.grafana_admin_password.path}}";
    # };

  };
}
