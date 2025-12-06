{ config, pkgs, ... }:

{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof noctalia-shell ipc call lockScreen lock || noctalia-shell ipc call lockScreen lock";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };
      listener = [
        {
          timeout = 400;
          on-timeout = "loginctl lock-session";
        }

        {
          timeout = 420;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }

        {
          timeout = 900;
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };
}
