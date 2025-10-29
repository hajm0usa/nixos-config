{
  config,
  pkgs,
  inputs,
  ...
}:

{
  home.packages = with pkgs; [
    hyprpicker
    hyprshot
  ];
  home.sessionVariables = {

  };

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {
      "$mod" = "SUPER";
      "$terminal" = "alacritty";
      "$fileManager" = "nautilus";
      "$menu" = "rofi -show drun";

      monitor = ",preferred,auto,1";

      exec-once = [
        "dunst"
        "nm-applet"
        "blueman-applet"
      ];

      env = [
        "XCURSOR_SIZE,22"
        "HYPRCURSOR_SIZE,22"
        "XCURSOR_THEME,${config.theme.cursorTheme}"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,hyprland"
        "QT_QPA_PLATFORM,wayland;xcb" # Use Wayland first, fallback to X11
        "GDK_BACKEND,wayland"
        "SDL_VIDEODRIVER,wayland" # For games using SDL
        "MOZ_ENABLE_WAYLAND,1" # Firefox/Thunderbird Wayland support
        "NIXOS_OZONE_WL,1"
        "QT_QPA_PLATFORMTHEME,qt5ct"
      ];

      input = {
        kb_layout = "us,ir";
        kb_options = "grp:win_space_toggle";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = true;
        };
        sensitivity = 0;
      };

      general = {
        gaps_in = 5;
        gaps_out = 7;
        border_size = 2;
        "col.active_border" =
          "rgba(${config.colorscheme.palette.base0C}ee) rgba(${config.colorscheme.palette.base0E}ee) 45deg";
        "col.inactive_border" = "rgba(${config.colorscheme.palette.base03}aa)";
        layout = "dwindle";
        allow_tearing = true;
      };

      decoration = {
        rounding = 5;
        blur = {
          enabled = true;
          size = 3;
          passes = 3;
          vibrancy = 0.1696;
          ignore_opacity = true;
          new_optimizations = true;
        };
        # drop_shadow = true;
        # shadow_range = 4;
        # shadow_render_power = 3;
        # "col.shadow" = "rgba(1a1a1aee)";
      };

      animations = {
        enabled = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 3;
      };

      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
      };

      windowrulev2 = [
        "opacity 0.85 0.85,class:^(Alacritty)$"
        "opacity 0.85 0.85,class:^(waybar)$"

        # Make floating windows slightly transparent
        "opacity 0.95 0.95,floating:1"

        # Keep some windows fully opaque
        "opacity 1.0 override 1.0 override,class:^(firefox)$"
        "opacity 1.0 override 1.0 override,title:^(.*YouTube.*)$"

        # Telegram media viewer
        "float,title:^(Media viewer)$"

        # Blueman (Bluetooth Manager) - Float by default
        "float,class:^(.blueman-manager-wrapped)$"
        "size 800 600,class:^(.blueman-manager-wrapped)$"
        "center,class:^(.blueman-manager-wrapped)$"

        "float,class:^(FlClash)$"
        "size 1000 600,class:^(FlClash)$"
        "center,class:^(FlClash)$"
      ];

      bind = [
        "$mod, Q, exec, $terminal"
        "$mod, C, killactive,"
        "$mod, M, exit,"
        "$mod, E, exec, $fileManager"
        "$mod, T, togglefloating,"
        "$mod, D, exec, $menu"
        "$mod, P, pseudo,"
        "$mod, J, togglesplit,"
        "$mod, F, fullscreen,"

        "$mod_SHIFT, s, exec, hyprshot -m region --clipboard-copy"

        "$mod, H, movefocus, l"
        "$mod, L, movefocus, r"
        "$mod, K, movefocus, u"
        "$mod, J, movefocus, d"

        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"

        # "$mod, S, togglespecialworkspace, magic"
        # "$mod SHIFT, S, movetoworkspace, special:magic"

        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
      bindel = [
        ",XF86AudioRaiseVolume,  exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume,  exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute,         exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle$"
        ",XF86AudioMicMute,      exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle$"
        ",XF86MonBrightnessUp,   exec, brightnessctl -e4 -n2 set 5%+"
        ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
      ];

      bindl = [
        ", XF86AudioNext,  exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay,  exec, playerctl play-pause"
        ", XF86AudioPrev,  exec, playerctl previous"
      ];
    };
  };
}
