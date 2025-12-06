{ config, pkgs, ... }:

{
  imports = [
    ./alacritty.nix
    # ./caelestia.nix
    ./daily.nix
    ./development.nix
    ./dunst.nix
    ./editors.nix
    ./fish.nix
    ./git.nix
    ./gtk.nix
    ./hypridle.nix
    ./hyprland.nix
    ./kitty.nix
    ./noctalia.nix
  ];
}
