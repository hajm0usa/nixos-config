{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Communication
    # discord
    telegram-desktop
    flclash

    # Media
    # spotify
    vlc
    mpv

    # File Management
    xfce.thunar
    nautilus
    ranger

    # Networking
    nmap

    # Archive Tools
    p7zip
    unrar
    unzip
    zip
    xz

    # System utilities
    jmtpfs
    libGL
    poppler_utils
    sushi
    xwayland
    wl-clipboard
  ];
}
