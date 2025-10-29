{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    rofi-wayland
  ];
  xdg.configFile."rofi/config.rasi".text = ''
    configuration{
        modi: "drun";
        show-icons: true;
        icon-theme: "Adwaita";
        terminal: "kitty";
        drun-display-format: "{icon} {name}";
        location: 0;
        disable-history: false;
        hide-scrollbar: true;
    }
    @theme "~/.config/rofi/menu.rasi"
  '';

  xdg.configFile."rofi/colors.rasi".text = ''
    * {
        background:     #${config.colorScheme.palette.base00};
        background-alt: #${config.colorScheme.palette.base02};
        foreground:     #${config.colorScheme.palette.base07};
        selected:       #${config.colorScheme.palette.base0C};
        border:         #${config.colorScheme.palette.base0E};
        active:         #${config.colorScheme.palette.base0C};
        urgent:         #${config.colorScheme.palette.base03};
    }
  '';

  xdg.configFile."rofi/menu.rasi".text = ''
    * {
        width: 600;
        font: "${config.theme.font} Propo 14";
    }
    @import                          "./colors.rasi"
    element-text, element-icon, mode-switcher {
        background-color: inherit;
        text-color: inherit;
        border-radius: 20px;
        font: @font;
        highlight: none; 
    }

    window {
        border: 2px;
        border-color: transparent;
        background-color: @background;
        border-radius: 20px;
        padding: 0px 20px 0px 0px;
        border-color: @border;
        font: @font;
    }

    mainbox {
        background-color: @background;
        font: @font;
    }

    inputbar {
        children: [prompt, entry];
        background-color: @background;
        border-radius: 5px;
        padding: 2px;
        font: @font;
    }

    prompt {
        enabled: false;
        background-color: @selected;
        padding: 5px;
        text-color: @background;
        border-radius: 5px;
        text-align: center;
        margin: 0px;
        font: @font;
    }

    textbox-prompt-colon {
        expand: false;
        str: ":";
        font: @font;
    }

    entry {
        padding: 0px 10px 8px 10px;  
        margin: 15px 0px 0px 15px;
        text-color: @foreground;
        background-color: @background;
        line-height: 30px;   
        font: @font;
        cursor-width: 11;
    }

    listview {
        border: 0px;
        padding: 4px 0px 13px;
        margin: 0px 0px 0px 20px;
        columns: 2;
        background-color: @background;
        fixed-height: false;
        lines: 7;
        border-radius: 0px;
        font: @font;
    }

    element {
        padding: 5px;
        border-radius: 15px;
        font: @font;
        background-color: @background;
        text-color: @foreground;
    }

    element-icon {
        enabled: true;
        size: 30px;
        font: @font;
    }

    element selected {
        background-color: @selected;
        border-radius: 15px;
        text-color: @background;
        font: @font;
    }

  '';

  xdg.configFile."rofi/powermenu.rasi".text = ''
    /*****----- Configuration -----*****/
    configuration {
        show-icons:                 false;
    }

    /*****----- Global Properties -----*****/
    @import                          "./colors.rasi"
    * {
        font: "${config.theme.font} Propo 14";
    }

    /*****----- Main Window -----*****/
    window {
        /* properties for window widget */
        transparency:                "real";
        location:                    center;
        anchor:                      center;
        fullscreen:                  false;
        width:                       800px;
        x-offset:                    0px;
        y-offset:                    0px;

        /* properties for all widgets */
        enabled:                     true;
        margin:                      0px;
        padding:                     0px;
        border:                      0px solid;
        border-radius:               20px;
        border-color:                @selected;
        cursor:                      "default";
        background-color:            @background;
    }

    /*****----- Main Box -----*****/
    mainbox {
        enabled:                     true;
        spacing:                     15px;
        margin:                      0px;
        padding:                     30px;
        border:                      0px solid;
        border-radius:               20px;
        border-color:                @selected;
        background-color:            transparent;
        children:                    [ "inputbar", "listview" ];
    }

    /*****----- Inputbar -----*****/
    inputbar {
        enabled:                     false;
        spacing:                     15px;
        margin:                      0px;
        padding:                     0px;
        border:                      0px;
        border-radius:               20px;
        border-color:                @selected;
        background-color:            transparent;
        text-color:                  @foreground;
        children:                    [ "textbox-prompt-colon", "prompt"];
    }

    dummy {
        background-color:            transparent;
    }

    textbox-prompt-colon {
        enabled:                     true;
        expand:                      false;
        str:                         "";
        padding:                     12px 16px;
        border-radius:               20px;
        background-color:            @urgent;
        text-color:                  @background;
    }
    prompt {
        enabled:                     true;
        padding:                     12px;
        border-radius:               20px;
        background-color:            @active;
        text-color:                  @background;
    }

    /*****----- Message -----*****/
    message {
        enabled:                     true;
        margin:                      0px;
        padding:                     12px;
        border:                      0px solid;
        border-radius:               20px;
        border-color:                @selected;
        background-color:            @background-alt;
        text-color:                  @foreground;
    }
    textbox {
        background-color:            inherit;
        text-color:                  inherit;
        vertical-align:              0.5;
        horizontal-align:            0.5;
        placeholder-color:           @foreground;
        blink:                       true;
        markup:                      true;
    }
    error-message {
        padding:                     12px;
        border:                      0px solid;
        border-radius:               20px;
        border-color:                @selected;
        background-color:            @background;
        text-color:                  @foreground;
    }

    /*****----- Listview -----*****/
    listview {
        enabled:                     true;
        columns:                     5;
        lines:                       1;
        cycle:                       true;
        dynamic:                     true;
        scrollbar:                   false;
        layout:                      vertical;
        reverse:                     false;
        fixed-height:                false;
        fixed-columns:               false;
        
        spacing:                     15px;
        margin:                      0px;
        padding:                     0px;
        border:                      0px solid;
        border-radius:               20px;
        border-color:                @selected;
        background-color:            transparent;
        text-color:                  @foreground;
        cursor:                      "default";
    }

    /*****----- Elements -----*****/
    element {
        enabled:                     true;
        spacing:                     0px;
        margin:                      0px;
        padding:                     40px 10px;
        border:                      0px solid;
        border-radius:               20px;
        border-bottom:               5px;
        border-color:                @selected;
        background-color:            @background-alt;
        text-color:                  @foreground;
        cursor:                      pointer;
    }
    element-text {
        font:                        "${config.theme.font} Propo 32";
        background-color:            transparent;
        text-color:                  inherit;
        cursor:                      inherit;
        vertical-align:              0.5;
        horizontal-align:            0.5;
    }
    element selected.normal {
        background-color:            var(selected);
        text-color:                  var(background);
    }
  '';

  xdg.configFile."rofi/powermenu.sh".text = builtins.readFile ../../scripts/powermenu.sh;
}
