{ inputs, ... }:
{
  flake.nixosModules.system = { ... }: {
    environment.etc."nixos".source = inputs.self;

    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];

    services.logind.settings.Login.HandlePowerKey = "hibernate";
    services.logind.settings.Login.HandlePowerKeyLongPress = "poweroff"; # optional: what a long press does

    # nix.gc.automatic = true;
    nix.optimise.automatic = true;

    time.timeZone = "Africa/Tunis";
    i18n.defaultLocale = "en_US.UTF-8";

    console.keyMap = "mod-dh-ansi-us";
    console.earlySetup = true;
  };
}
