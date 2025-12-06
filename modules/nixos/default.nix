{ config, pkgs, ... }:

{
  imports = [
    ./bluetooth.nix
    ./hyprland.nix
    ./docker.nix
    ./gaming.nix
    ./networking.nix
    ./gnome.nix
  ];
}
