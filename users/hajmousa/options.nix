{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

{
  options = {
    enable-gaming = mkOption {
      type = defaults.bool;
      default = false;
      description = "Gaming packages required for gaming on linux + steam";
    };

    theme = {
      cursorSize = mkOption {
        type = types.int;
        description = "Cursor Size";
      };
      cursorTheme = mkOption {
        type = types.str;
        description = "Cursror Theme";
      };
      font = mkOption {
        type = types.str;
        description = "Default font";
      };

      font-mono = mkOption {
        type = types.str;
        description = "Default Monospace font";
      };

      profilePicture = mkOption {
        type = types.str;
        description = "Profile pictuer file path";
      };

      wallpaper = mkOption {
        type = types.str;
        description = "Wallpaper file path";
      };
    };
  };
}
