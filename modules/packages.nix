{

  config,
  lib,
  pkgs,
  ...
}:
{
  # Programs
  # programs.gnupg.agent.enable = true;

  # programs.localsend.enable = true; # local file sharing between devices

  programs.fuse.enable = true;
  services.udisks2.enable = true;

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
    curl
    wtype
    wget

    # hugo
    # gh
    # glab
    # opentofu
    # ansible
    #
    # opencode

    # Security & privacy
    # (pass.withExtensions (ext: [ ext.pass-otp ]))
    # zbar
    # keepassxc
    # keepass

    # Media tools
    # yt-dlp
    # ffmpeg

    # Apps
    # libreoffice
    # firefox
    # qutebrowser
    # signal-desktop
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
  ];

  # nixpkgs.config.android_sdk.accept_license = true;
  # nixpkgs.config.allowUnfreePredicate =
  #   pkg:
  #   builtins.elem (lib.getName pkg) [
  #     # "discord"
  #   ];
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
