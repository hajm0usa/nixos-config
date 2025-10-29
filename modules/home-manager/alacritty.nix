{ pkgs, config, ... }:

{
  programs.alacritty = {
    enable = true;

    settings = {
      window.opacity = 0.85;
      cursor.style.shape = "Beam";

      font = {
        normal.family = config.theme.font-mono;
        size = 12;
      };

      colors = with config.colorScheme.palette; {
        primary = {
          background = "#${base00}";
          foreground = "#${base05}";
        };
        normal = {
          black = "#${base00}";
          red = "#${base08}";
          green = "#${base0B}";
          yellow = "#${base0A}";
          blue = "#${base0D}";
          magenta = "#${base0E}";
          cyan = "#${base0C}";
          white = "#${base05}";
        };
        bright = {
          black = "#${base03}";
          red = "#${base08}";
          green = "#${base0B}";
          yellow = "#${base0A}";
          blue = "#${base0D}";
          magenta = "#${base0E}";
          cyan = "#${base0C}";
          white = "#${base07}";
        };
      };
    };
  };
}
