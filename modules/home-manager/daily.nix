{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    # Communication
    telegram-desktop
    paper-plane
    thunderbird

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
    texstudio
    kile
    (texlive.combine {
      inherit (texlive)
        scheme-small
        xepersian
        bidi
        fontspec
        zref
        pgfplots
        tcolorbox
        tikzfill
        pdfcol
        mdframed
        needspace
        algorithms
        algpseudocodex
        algorithm2e
        ifoddpage
        relsize
        ;
    })
  ];
}
