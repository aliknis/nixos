{ ... }:
{
  flake.nixosModules.nvim = { pkgs, ... }: {
    programs.neovim = {
      enable = true;
      withPython3 = true;
    };
    programs.neovim.defaultEditor = true;

    environment.systemPackages = with pkgs; [
      ripgrep # Fast search tool
      tree-sitter

      # [NIX]
      nixd
      nixfmt

      # [C]
      gcc
      gdb
      clang
      clang-tools

      # [Python/Jupyter]
      (python3.withPackages (ps: [
        ps.debugpy # Python Debugger
        ps.pytest # Python Tester
      ])) # Python interpreter
      pyright # Python LSP
      black # Python formatter

      # [BASH]
      bash-language-server # Bash LSP
      shfmt # Shell formatter

      # [LUA]
      lua-language-server # Lua LSP
      stylua # Lua formatter

      # [JavaScript/Web]
      prettier
      typescript-language-server
      vscode-langservers-extracted

      # [SQL]
      sql-formatter

      # [Terraform]
      tofu-ls # opentofu language server

      # [LATEX]
      texliveFull # latex compiler for vimtex plugin
      texlab
      zathura

      # [Hyprlang]
      # hyprls

      # [UML]
      # imagemagick
      # plantuml
      # mermaid-cli
      # kitty

    ];
  };
}
