{ ... }:
{
  flake.nixosModules.hyprland = { pkgs, ... }: {
    programs.hyprland.enable = true;
    programs.hyprlock.enable = true;

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
      command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --remember-session --cmd start-hyprland";
      user = "greeter";
    };
  };
}
