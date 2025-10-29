{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;

    displayManager.gdm = {
      enable = true;
      wayland = true;
      autoSuspend = false;
    };

    desktopManager.gnome.enable = true;
  };

  services.gnome = {
    core-apps.enable = true;
    gnome-keyring.enable = true;
    gnome-settings-daemon.enable = true;
  };

  environment.gnome.excludePackages = with pkgs; [
    epiphany
    geary
    gnome-weather
    simple-scan
    yelp
  ];

  environment.systemPackages = with pkgs; [
    gnome-tweaks
    gnome-shell-extensions
    dconf-editor
    gnomeExtensions.user-themes
    adwaita-icon-theme
    gnome-extension-manager
  ];

  programs.dconf.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
  };
}
