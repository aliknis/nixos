{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.git = {
    enable = true;
    config = {
      core.pager = "delta";
      interactive.diffFilter = "delta --color-only";
      delta.navigate = true;
      delta.line-numbers = true;
      merge.conflictStyle = "zdiff3";

      user.name = "aliknis";
      user.email = "titanknis@gmail.com";
      init.defaultBranch = "main";

      gpg.format = "ssh";
      user.signingkey = "~/.ssh/id_ed25519.pub";
      commit.gpgsign = true;
    };
  };

  environment.systemPackages = with pkgs; [
    delta
  ];
}
