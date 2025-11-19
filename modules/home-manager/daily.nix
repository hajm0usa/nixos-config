{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    # Communication
    telegram-desktop
    paper-plane
    thunderbird
    flclash

    # Media
    vlc
    totem
    loupe
    inkscape
    gapless
    obs-studio
    gimp
    kdePackages.kdenlive

    # Documents
    libreoffice-fresh
    evince
    xournalpp
    obsidian
    pdfarranger

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
