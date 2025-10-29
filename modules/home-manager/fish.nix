{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;

    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/.config/nixos#sauron";
      update = "nix flake update ~/.config/nixos && rebuild";
      clean = "sudo nix-collect-garbage -d";

      ls = "eza --icons";
      ll = "eza -lah --icons";
      tree = "eza --tree --icons";
    };

    shellInit = ''
      set -g fish_greeting
    '';

    interactiveShellInit = ''
      set -g theme_color_scheme eclm
    '';
  };

  home.packages = with pkgs; [
    eza
    bat
    fzf
    zoxide
    direnv
  ];
}
