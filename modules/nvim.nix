{ ... }:
{
  flake.nixosModules.nvim = { pkgs, ... }: {
    programs.neovim.enable = true;
    programs.neovim.defaultEditor = true;

    environment.systemPackages = with pkgs; [
      ripgrep
      tree-sitter

      nixd
      nixfmt

      gcc
      gdb
      clang
      clang-tools

      prettier
      typescript-language-server
      vscode-langservers-extracted

      sql-formatter

      tofu-ls # opentofu language server
    ];
  };
}
