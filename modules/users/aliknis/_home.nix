{
  pkgs,
  config,
  lib,
  ...
}:
let
  username = builtins.baseNameOf ./.;
in
{
  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "26.11";
  programs.home-manager.enable = true;

  # [Git]
  programs.git.enable = true;
  programs.git.settings = {
    user.name = "aliknis";
    user.email = "titanknis@gmail.com";
    core.pager = "delta";
    interactive.diffFilter = "delta --color-only";
    delta.navigate = true;
    delta.line-numbers = true;
    merge.conflictStyle = "zdiff3";
    init.defaultBranch = "main";
    gpg.format = "ssh";
    user.signingkey = "~/.ssh/id_ed25519.pub";
    commit.gpgsign = true;
  };
  home.packages = with pkgs; [ delta ];

  # [THEME]
  gtk.enable = true;
  gtk.iconTheme.name = "Papirus-Dark";
  gtk.iconTheme.package = pkgs.papirus-icon-theme;
  gtk.colorScheme = "dark";
  # gtk.gtk4.theme = null;

  home.pointerCursor.enable = true;
  home.pointerCursor.name = "Bibata-Modern-Ice";
  home.pointerCursor.package = pkgs.bibata-cursors;
  home.pointerCursor.hyprcursor.enable = true;

  # [Dotfiles]
  home.file =
    let
      useSymlinks = true;
      # useSymlinks = false;

      mkSymlink = config.lib.file.mkOutOfStoreSymlink;
      dotfilesDir = "${config.home.homeDirectory}/nixos/modules/users/${username}/dotfiles";
      mkDotfile = name: {
        source = if useSymlinks then mkSymlink "${dotfilesDir}/${name}" else ./dotfiles/${name};
      };
    in
    lib.genAttrs [
      ".config/hypr"
      ".config/kitty"
      ".config/mako"
      ".config/mpv"
      ".config/rofi"
      ".config/yt-dlp"
      ".config/zathura"
      ".config/keepassxc"

      ".config/nvim/lua"
      ".config/nvim/snippets"
      ".config/nvim/templates"
      ".config/nvim/init.lua"

      ".config/qutebrowser/config.py"
      ".config/qutebrowser/themes"

      ".config/xmrig.json"

      ".aliases"
      ".bashrc"
      ".zshrc"
      ".clang-format"
    ] mkDotfile;
}
