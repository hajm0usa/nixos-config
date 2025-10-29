{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;

    ignores = [
      ".DS_Store"
      "*.swp"
      "*.swo"
      "*~"
      ".idea/"
      ".vscode/"
      "node_modules/"
      "__pycache__/"
      "*.pyc"
    ];
  };

  programs.lazygit = {
    enable = true;
    settings = {
      gui.theme = {
        activeBorderColor = [
          "green"
          "bold"
        ];
        inactiveBorderColor = [ "white" ];
      };
    };
  };
}
