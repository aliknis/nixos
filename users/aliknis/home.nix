{
  config,
  username,
  pkgs,
  lib,
  ...
}:

{
  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "26.11";
  programs.home-manager.enable = true;

  #############
  ### THEME ###
  #############

  gtk = {
    enable = true;

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    colorScheme = "dark";
    gtk4.theme = null;
  };

  home.pointerCursor = {
    name = "Bibata-Modern-Ice";
    package = pkgs.bibata-cursors;
    hyprcursor.enable = true;
  };

  ################
  ### DOTFILES ###
  ################

  home.file =
    lib.genAttrs
      [
        ".config/hypr"
        ".config/kitty"
        ".config/mako"
        ".config/mpv"
        ".config/nvim"
        ".config/qutebrowser"
        ".config/rofi"
        ".config/waybar"
        ".config/yt-dlp"
        ".config/zathura"

        ".aliases"
        ".bashrc"
        ".zshrc"
        ".clang-format"
      ]
      (name: {
        source = ./dotfiles/${name}; # Default: Immutable store path (works anywhere, requires rebuild for changes)

        # Alternative: Editable symlink (requires flake in ~/nixos, changes apply instantly)
        # source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/users/${username}/dotfiles/${name}";
      });
}
