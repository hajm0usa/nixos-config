{
  config,
  lib,
  pkgs,
  ...
}:
{

  home.packages = with pkgs; [ libnotify ];

  services.dunst = {
    enable = true;
    iconTheme = {
      name = "Adwaita-Dark";
      package = pkgs.adwaita-icon-theme;
    };
    settings = {
      global = {
        rounded = "yes";
        origin = "top-right";
        monitor = "0";
        alignment = "left";
        vertical_alignment = "center";
        width = "400";
        height = "400";
        scale = 0;
        gap_size = 0;
        progress_bar = true;
        transparency = 0;
        text_icon_padding = 0;
        separator_color = "frame";
        sort = "yes";
        idle_threshold = 5;
        line_height = 0;
        markup = "full";
        show_age_threshold = 5;
        ellipsize = "middle";
        ignore_newline = "no";
        stack_duplicates = true;
        sticky_history = "yes";
        history_length = 20;
        always_run_script = true;
        corner_radius = 20;
        follow = "mouse";
        font = config.theme.font;
        format = "<b>%s</b>\\n%b";
        progress_bar_corner_radius = 20 - 10;
        #format = ''
        #  <span foreground='#${config.theme.palette.primary-bg}'><b>%s %p</b></span>
        #  %b'';
        frame_color = "#" + config.colorScheme.palette.base0C;
        highlight = "#" + config.colorScheme.palette.base00;
        foreground = "#" + config.colorScheme.palette.base07;
        frame_width = 1;
        offset = "0x10";
        horizontal_padding = 10;
        icon_position = "left";
        indicate_hidden = "yes";
        min_icon_size = 0;
        max_icon_size = 64;
        mouse_left_click = "do_action, close_current";
        mouse_middle_click = "close_current";
        mouse_right_click = "close_all";
        padding = 10;
        plain_text = "no";
        separator_height = 2;
        show_indicators = "yes";
        shrink = "no";
        word_wrap = "yes";
        browser = "zen-twilight";
      };

      fullscreen_delay_everything = {
        fullscreen = "delay";
      };

      urgency_critical = {
        background = "#" + config.colorScheme.palette.base00;
        foreground = "#" + config.colorScheme.palette.base00;
      };
      urgency_low = {
        background = "#" + config.colorScheme.palette.base00;
        foreground = "#" + config.colorScheme.palette.base0A;
      };
      urgency_normal = {
        background = "#" + config.colorScheme.palette.base00;
        foreground = "#" + config.colorScheme.palette.base0C;
      };
    };
  };
}
