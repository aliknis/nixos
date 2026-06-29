{

  config,
  lib,
  pkgs,
  ...
}:
{
  # Programs
  programs.gnupg.agent.enable = true;

  programs.localsend.enable = true; # local file sharing between devices

  # # Fonts
  fonts.packages = with pkgs; [ nerd-fonts.jetbrains-mono ];

  environment.variables = {
    QT_QPA_PLATFORM = "wayland"; # for keepassxc
  };

  # System packages
  environment.systemPackages = with pkgs; [
    # Terminal
    kitty
    # shell tools
    aria2
    wl-clipboard
    zoxide
    eza
    bat
    fzf
    tldr
    wtype
    # taskwarrior3
    # jq # rofi-timer script dependency
    curl
    wget

    # hugo
    # gh
    # glab
    #
    # opencode

    # Security & privacy
    # (pass.withExtensions (ext: [ ext.pass-otp ]))
    # zbar
    keepassxc
    # keepass

    # Media tools
    yt-dlp
    ffmpeg

    # Apps
    # libreoffice
    # firefox
    qutebrowser
    signal-desktop
    # freetube

    # wineWowPackages.full
    # winetricks
    # asciinema

    # Fun
    # sl
    # fastfetch
    # cmatrix
    # asciiquarium
    # fortune
    # cowsay
    # ponysay
    # pipes
    # figlet
    # ninvaders
    # hollywood
    # cava
    # cbonsai
    # clock-rs
    # cool-retro-term
    # lolcat

    # Unfree
    # discord

  ];

  # nixpkgs.config.android_sdk.accept_license = true;
  # nixpkgs.config.allowUnfreePredicate =
  #   pkg:
  #   builtins.elem (lib.getName pkg) [
  #     # "discord"
  #   ];

  # nixpkgs.config.permittedInsecurePackages = [
  #   "ciscoPacketTracer8-8.2.2"
  # ];

  # Commented packages for reference
  /*
    # Office Suite
    onlyoffice-bin
    libreoffice

    # Editing
    krita
    nomacs
    obs-studio

    # CLI Tools
    disko
    dust
    libnotify
    libqalculate
    asciinema
    asciinema-agg

    # Networking
    aria2
    nload
    bmon
    btop

    # Fun
    sl
    fastfetch
    cmatrix
    asciiquarium
    fortune
    cowsay
    ponysay
    pipes
    figlet
    ninvaders
    hollywood
    cava
    cbonsai
    clock-rs
  */
}
