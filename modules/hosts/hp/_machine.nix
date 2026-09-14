{ inputs, ... }:
{
  hostname = builtins.baseNameOf ./.;
  username = "aliknis";
  imports = [
    inputs.self.nixosModules.boot
    inputs.self.nixosModules.system
    inputs.self.nixosModules.services
    inputs.self.nixosModules.sops
    inputs.self.nixosModules.packages
    inputs.self.nixosModules.networking
    inputs.self.nixosModules.kanata

    inputs.self.nixosModules.hyprland
    inputs.self.nixosModules.nvim
    inputs.self.nixosModules.zsh
    inputs.self.nixosModules.monero

    inputs.self.nixosModules.vm
    inputs.self.nixosModules.preservation

    inputs.self.nixosModules.aliknis
    inputs.self.nixosModules.root
  ];
}
