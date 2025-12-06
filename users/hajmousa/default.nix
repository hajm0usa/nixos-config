{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    inputs.nix-colors.homeManagerModules.default
    inputs.zen-browser.homeModules.beta

    ../../modules/home-manager
    ./options.nix
    ./packages.nix
  ];

  colorscheme = inputs.nix-colors.colorschemes.catppuccin-mocha;

  enable-gaming = true;

  theme = {
    cursorSize = 22;
    cursorTheme = "Bibata-Modern-Ice";
    font = "JetBrainsMono NerdFont";
    font-mono = "CaskaydiaMono NerdFont Propo";
    profilePicture = "/home/hajmousa/Pictures/Brook.png";
    wallpaper = "/home/hajmousa/Pictures/Background.jpg";
  };

  home = {
    username = "hajmousa";
    homeDirectory = "/home/hajmousa";
    stateVersion = "25.05";
    enableNixpkgsReleaseCheck = false;
    packages = [
      inputs.adw-bluetooth.packages."x86_64-linux".default
      inputs.antigravity-nix.packages."x86_64-linux".default
    ];
  };

  programs.home-manager.enable = true;

  xdg.userDirs = {
    enable = true;
    documents = "$HOME/Documents";
    download = "$HOME/Downloads";
    music = "$HOME/Music";
    pictures = "$HOME/Pictures";
    videos = "$HOME/Videos";
  };

  programs.git = {
    enable = true;
    settings = {
      init.defaultBranch = "main";
      pull.rebase = true;
      core.editor = "nvim";

      user = {
        name = "HajMousa";
        email = "hajmousa1385@gmail.com";
      };
    };
  };
  programs.fish.enable = true;


  programs.zen-browser.enable = true;

  services.mpris-proxy.enable = true;

  systemd.user.startServices = "sd-switch";

  systemd.user.services.polkit-gnome-authentication-agent-1 = {
    Unit = {
      Description = "polkit-gnome-authentication-agent-1";
      Wants = [ "graphical-session.target" ];
      After = [ "graphical-session.target" ];
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
    Service = {
      Type = "simple";
      ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };
}
