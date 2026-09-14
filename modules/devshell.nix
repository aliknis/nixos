# modules/devshell.nix
{
  perSystem =
    { pkgs, ... }:
    {
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [ sops ];
        shellHook = ''
          export SOPS_AGE_KEY=$(systemd-ask-password | ssh-to-age -private-key -stdinpass -i "$HOME/.ssh/id_ed25519")
          zsh
        '';
      };
    };
}
