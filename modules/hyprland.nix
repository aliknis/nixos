{ ... }:
{
  flake.nixosModules.hyprland = { pkgs, config, ... }: {

    programs.hyprlock.enable = true;

    programs.hyprland.enable = true;
    programs.hyprland.withUWSM = true;

    programs.yazi.enable = true; # Yazi and use Yazi as the filePicker
    xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-termfilechooser ];
    xdg.portal.config.common."org.freedesktop.impl.portal.FileChooser" = [ "termfilechooser" ];
    environment.sessionVariables.GTK_USE_PORTAL = "1";
    environment.sessionVariables.QT_QPA_PLATFORMTHEME = "xdgdesktopportal";

    environment.systemPackages = with pkgs; [
      (rofi.override { plugins = [ rofi-calc ]; })
      libnotify
      mako

      awww
      cliphist

      brightnessctl
      playerctl
      pavucontrol
      networkmanagerapplet
      batsignal

      hyprpicker
      hyprpolkitagent
      hyprsunset

      grim
      slurp
      tesseract
    ];

    # services.getty.autologinUser = "${config.username}";
    # services.getty.autologinOnce = true;
    #
    # environment.loginShellInit = "if [ -z \"$DISPLAY\" ] && [ \"$XDG_VTNR\" -eq 1 ]; then start-hyprland; fi";
    # services.displayManager.ly.enable = true;

    services.greetd.enable = true;
    services.greetd.settings.default_session = {
      command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --sessions ${config.services.displayManager.sessionData.desktops}/share/wayland-sessions --cmd 'uwsm start hyprland-uwsm.desktop'";
      user = "greeter";
    };
  };
}
