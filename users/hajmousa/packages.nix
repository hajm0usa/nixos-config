{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Communication
    # discord
    flclash
    firefox

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
    xorg.libXext
    poppler-utils
    sushi
    xwayland
    wl-clipboard
    ffmpeg
    imagemagick
    fastfetch

    steam-run
    hexo-cli

    qemu
    quickshell

  ];
}
