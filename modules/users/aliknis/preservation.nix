{ ... }: {
  flake.nixosModules.preservation =
    { ... }:
    let
      username = builtins.baseNameOf ./.;
    in
    {
      systemd.tmpfiles.rules = [ "h /home/${username}/.bitmonero - - - - +C" ]; # Disable COW on IO Heavy DBs and folders

      preservation.preserveAt."/persistent".users.${username} = {
        directories = [
          {
            directory = ".ssh";
            mode = "0700";
          }
          "nixos"
          "Notes"
          "Downloads"
          "Documents"
          "Projects"
          "homelab"
          "Pictures"
          "Videos"
          "Secrets"

          ".bitmonero"

          ".local/share/nvim"
          ".local/share/zoxide"
          ".local/share/qutebrowser"
          ".local/share/opencode"
          ".config/qutebrowser"
          ".config/opencode"

          ".cache/keepassxc"

          ".config/Signal"
          ".config/syncthing"
        ];

        files = [ ".zsh_history" ];
      };
    };
}
