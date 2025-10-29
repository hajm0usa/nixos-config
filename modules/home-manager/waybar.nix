{ config, pkgs, ... }:

with config.colorscheme;

{
  programs.waybar = {
    enable = true;
    systemd.enable = true;

    settings = [
      {
        layer = "top";
        position = "top";
        height = 34;
        spacing = 4;

        modules-left = [
          "custom/wmname"
          "hyprland/workspaces"
          "hyprland/window"
        ];
        modules-center = [ "clock" ];
        modules-right = [
          "tray"
          "hyprland/languages"
          "cpu"
          "memory"
          "network"
          "bluetooth"
          "wireplumber"
          "backlight"
          "battery"
          "custom/powermenu"
        ];

        "hyprland/workspaces" = {
          format = "{name}";
          on-click = "activate";
        };

        "hyprland/window" = {
          max-length = 30;
        };

        "hyprland/languages" = {
          format = " {}";
          format-en = "En";
          format-fa = "فا";
        };

        clock = {
          interval = 1;
          format = " {:%H:%M}";
          format-alt = "  {:%A, %B %d, %Y}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };

        cpu = {
          format = " {usage}%";
          tooltip = true;
        };

        memory = {
          format = " {}%";
        };

        battery = {
          bat = "BAT0";
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          format-alt = "{icon} {time}";
          format-icons = [
            "󰁺"
            "󰁼"
            "󰁾"
            "󰂀"
            "󰁹"
          ];
        };

        backlight = {
          device = "intel_backlight";
          format = "{icon} {percent}%";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
          ];
          on-scroll-up = "brightnessctl set +5%";
          on-scroll-down = "brightnessctl set 5%-";
          tooltip-format = "Brightness: {percent}%";
        };

        network = {
          format-ethernet = "󰈀 {ipaddr}";
          format-linked = "(No IP)";
          format-wifi = "󰤨 {essid}";
          format-icons = [
            "󰤯"
            "󰤟"
            "󰤢"
            "󰤥"
            "󰤨"
          ];
          format-disconnected = "󰤮";
          tooltip-format = " {ifname} via {gwaddr}";
        };

        bluetooth = {
          format = "󰂯 {status}";
          format-connected = "󰂯 {device_alias}";
          format-disabled = "󰂲";
          tooltip-format-connected-enumerate-battery = "󰂯 {device_alias} {device_battery_percentage}%";
          on-click = "blueman-manager";
        };

        wireplumber = {
          format = "{icon} {volume}%";
          format-muted = "";
          format-icons = [
            "󰕿"
            "󰖀"
            "󰕾"
          ];
          scroll-step = 5;
        };

        tray = {
          spacing = 10;
        };

        "custom/wmname" = {
          format = "";
          on-click = "rofi -show drun";
          on-click-release = "sleep 0";
        };

        "custom/powermenu" = {
          format = "";
          on-click = "bash ~/.config/rofi/powermenu.sh";
          on-click-release = "sleep 1";
        };
      }
    ];

    style = ''
      * {
        border: none;
        font-family: ${config.theme.font} Propo;
        font-size: 14px;
        font-weight: bold;
      }

      window#waybar {
        background-color: rgba(40, 40, 40, 0.2);
        border-radius: 6px;
        color: #${palette.base07};
        opacity: 0.9;
        transition-property: background-color;
        transition-duration: .5s;
        margin-bottom: -7px;
      }

      window#waybar.hidden {
        opacity: 0.2;
      }

      window#hyprland-window {
        background-color: #${palette.base00};
      }

      #mode,
      #window,
      #cpu,
      #memory,
      #custom-powermenu,
      #custom-wmname,
      #clock,
      #hyprlan-languages,
      #wireplumber,
      #backlight,
      #battery,
      #network,
      #bluetooth,
      #tray {
        background-color: #${palette.base00};
        padding: 0 10px;
        margin: 5px 2px 5px 2px;
        border: 1px solid rgba(0, 0, 0, 0);
        border-radius: 6px;
        background-clip: padding-box;
      }

      #custom-wmname {
        color: #${palette.base0C};
        font-size: 20px;
      }

      #workspaces {
        background-color: transparent;
        margin: 5px 2px 5px 2px;
      }

      #workspaces button {
        background-color: #${palette.base02};
        padding: 0 5px;
        min-width: 20px;
        margin: 1px 1px 1px 1px;
        border-radius: 25%;
        color: #${palette.base07};
      }

      #workspaces button:hover {
        background-color: rgba(0, 0, 0, 0)
      }

      #workspaces button.active {
        background-color: #${palette.base0C};
      }

      #workspaces button.urgent {
        color: #${palette.base08};
      }

      #cpu {
        padding: 0 10px;
        color: #${palette.base0C};
      }

      #memory {
        padding: 0 10px;
        color: #${palette.base0A};
      }

      #clock {
        padding: 0 10px;
        color: #${palette.base0D};
      }

      #language {
        padding: 0 10px;
        color: #${palette.base0D};
      }

      #wireplumber {
        padding: 0 10px;
        color: #${palette.base0E};
      }

      #wireplumber.muted {
        padding: 0 10px;
        background-color: #${palette.base08};
        color: #${palette.base00};
      }

      #network {
          padding: 0 10px;
          color: #${palette.base0D};
      }

      #network.disconnected {
          padding: 0 10px;
          background-color: #${palette.base08};
          color: #${palette.base00};
      }

      #bluetooth {
          padding: 0 10px;
          color: #${palette.base0D};
      }

      #bluetooth.disabled {
          padding: 0 10px;
          background-color: #${palette.base08};
          color: #${palette.base00};
      }

      #custom-powermenu {
          background-color: #${palette.base08};
          color: #${palette.base00};
          font-size: 15px;
          padding-right: 6px;
          padding-left: 6px;
          margin: 5px;
      }

      #backlight {
        padding: 0 10px;
        color: #${palette.base0A};
      }

      #battery {
        padding: 0 10px;
        color: #${palette.base0C};
      }

      #battery.full {
        color: #${palette.base0B};
      }

      #battery.charging {
        color: #${palette.base0B};
      }

      #battery.wawrning {
        color: #${palette.base09};
      }

      #battery.critical {
        color: #${palette.base08};
      }
    '';
  };
}
