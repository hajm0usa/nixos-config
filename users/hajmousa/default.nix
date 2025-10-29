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

  colorscheme = inputs.nix-colors.colorschemes.gruvbox-dark-hard;

  enable-gaming = false;

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
}
