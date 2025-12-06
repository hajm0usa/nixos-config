{
  config,
  pkgs,
  inputs,
  ...
}:

{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
    ];
  };

  environment.systemPackages = with pkgs; [
    dunst
    slurp
    wl-clipboard
    swappy
    hyprpicker
    brightnessctl
    playerctl
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    font-awesome
    nerd-fonts.caskaydia-mono
    nerd-fonts.jetbrains-mono

    times-newer-roman

    vazir-fonts
  ];

  fonts.fontconfig.localConf = ''
    <?xml version="1.0"?>
    <!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
    <fontconfig>
      <!-- For Persian (fa), prefer Vazirmatn -->
      <match>
        <test name="lang" compare="contains">
          <string>fa</string>
        </test>
        <edit name="family" mode="prepend">
          <string>Vazirmatn</string>
        </edit>
      </match>
    </fontconfig>
  '';

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
}
