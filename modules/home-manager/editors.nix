{ config, pkgs, ... }:
{
  #home.packages = [
  #  pkgs.jetbrains.pycharm-community
  #  pkgs.jetbrains.datagrip
  #];

  programs.vscode.enable = true;

  programs.helix.enable = true;

  programs.neovim.enable = true;
  programs.neovide.enable = true;
}
