{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.swayosd
  ];
}
