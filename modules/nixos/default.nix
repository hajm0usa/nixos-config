{ config, pkgs, ... }:

{
  imports = [
    ./bluetooth.nix
    ./hyprland.nix
    ./docker.nix
    ./networking.nix
    ./gnome.nix
  ];
}
