{ ... }:
{
  flake.nixosModules.packages = { pkgs, lib, ... }: {
    programs.localsend.enable = true; # Local Send

    fonts.packages = with pkgs; [ nerd-fonts.jetbrains-mono ]; # Font

    programs.yazi.enable = true; # Yazi and use Yazi as the filePicker

    xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-termfilechooser ];
    xdg.portal.config.common."org.freedesktop.impl.portal.FileChooser" = [ "termfilechooser" ];

    environment.variables.QT_QPA_PLATFORM = "wayland"; # for keepassxc
    xdg.mime.defaultApplications."application/pdf" = "org.pwmt.zathura.desktop"; # Default PDF viewer

    environment.systemPackages = with pkgs; [
      kitty
      mpv
      imv
      zathura

      # CLI tools
      aria2
      wl-clipboard
      zoxide
      eza
      bat
      fzf
      tldr
      curl
      wget
      yt-dlp
      ffmpeg

      keepassxc

      qutebrowser

      opentofu
      # opencode

      # libreoffice
    ];
  };
}
