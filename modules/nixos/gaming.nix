{
  config,
  lib,
  pkgs,
  ...
}:

{
  config = lib.mkIf config.enable-gaming {
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      gamescopeSession.enable = true;
    };

    programs.gamemode = {
      enable = true;
      settings = {
        general = {
          renice = 10;
        };
        custom = {
          start = "${pkgs.libnotify}/bin/notify-send 'GameMode started'";
          end = "${pkgs.libnotify}/bin/notify-send 'GameMode ended'";
        };
      };
    };

    environment.systemPackages = with pkgs; [
      protonup-qt
      mangohud
      gamemode
      lutris
      heroic
    ];

    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
}
