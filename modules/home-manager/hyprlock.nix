{ config, pkgs, ... }:

{
  home.packages = [ pkgs.hyprlock ];
  xdg.configFile."hypr/hyprlock.conf".text = ''
    # BACKGROUND
    background {
        monitor =
        path = ${config.theme.wallpaper}
        blur_passes = 3
        contrast = 0.8916
        brightness = 0.8172
        vibrancy = 0.1696
        vibrancy_darkness = 0.0
    }

    # GENERAL
    general {
        no_fade_in = false
        grace = 0
        disable_loading_bar = false
    }

    # TIME
    label {
        monitor =
        text = cmd[update:1000] echo "$(date +"%H:%M")"
        font_size = 120
        font_family = ${config.theme.font} SemiBold
        position = 0, -140
        halign = center
        valign = top
    }

    # DAY-DATE-MONTH
    label {
        monitor =
        text = cmd[update:1000] echo "<span>$(jdate '+%G, %d %V')</span>"
        color = ${config.colorScheme.palette.base09}
        font_size = 30
        font_family = Vazirmatn Bold
        position = 0, 200
        halign = center
        valign = center
    }

    image {
      monitor =
      path = ${config.theme.profilePicture}
      border_color = ${config.colorScheme.palette.base08}
      border_size = 0
      size = 200
      rounding = -1
      rotate = 0
      reload_time = -1
      reload_cmd = 
      position = 0, 50
      halign = center
      valign = center
    }

    # USER
    label {
        monitor =
        text = HajMousa
        color = rgba(255, 255, 255, .65)
        font_size = 25
        font_family = ${config.theme.font} Bold
        position = 0, -70
        halign = center
        valign = center
    }

    # INPUT FIELD
    input-field {
        monitor =
        size = 290, 60
        outline_thickness = 2
        dots_size = 0.2 
        dots_spacing = 0.2
        dots_center = true
        outer_color = rgba(0, 0, 0, 0)
        inner_color = rgba(60, 56, 54, 0.35)
        font_color = rgb(200, 200, 200)
        fade_on_empty = false
        font_family = ${config.theme.font} Bold
        placeholder_text = <i><span foreground="##ffffff99">Enter password</span></i>
        hide_input = false
        position = 0, -140
        halign = center
        valign = center
    }

    # CURRENT SONG
    label {
        monitor =
        text = cmd[update:1000] echo "$(~/.config/hypr/Scripts/songdetail.sh)" 
        color = rgba(235, 219, 178, .75)
        font_size = 16
        font_family = ${config.theme.font}
        position = 0, 80
        halign = center
        valign = bottom
    }
  '';
}
