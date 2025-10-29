{ config, pkgs, ... }:

{
  services.hyprpaper = {
    enable = true;

    settings = {
      preload = [ "${config.theme.wallpaper}" ];
      wallpaper = [ "eDP-1, ${config.theme.wallpaper}" ];
    };
  };
}
