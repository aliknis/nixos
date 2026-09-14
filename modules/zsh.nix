{ ... }:
{
  flake.nixosModules.zsh = { pkgs, ... }: {
    programs.starship.enable = true;

    programs.zsh.enable = true;
    programs.zsh.syntaxHighlighting.enable = true;
    programs.zsh.autosuggestions.enable = true;
    users.defaultUserShell = pkgs.zsh;
  };
}
