{ config, pkgs, ... }:

{
  imports = [
    ./alacritty.nix
    ./daily.nix
    ./development.nix
    ./dunst.nix
    ./editors.nix
    ./fish.nix
    ./git.nix
    ./gtk.nix
    ./hypridle.nix
    ./hyprland.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./rofi.nix
    ./swayosd.nix
    ./waybar.nix
  ];
}
