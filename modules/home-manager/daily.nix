{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    # Communication
    telegram-desktop
    thunderbird
    flclash

    # Media
    vlc
    totem
    loupe
    inkscape

    # Documents
    libreoffice-fresh
    evince
    xournalpp
    obsidian

    setzer
    (texlive.combine {
      inherit (texlive)
        scheme-small
        xepersian
        bidi
        fontspec
        zref
        ;
    })
  ];
}
