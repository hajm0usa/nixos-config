{ config, pkgs, ... }:

{
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    daemon.settings.dns = [
      "185.51.200.2"
      "178.22.122.100"
    ];
    autoPrune = {
      enable = true;
      dates = "weekly";
    };
  };

  environment.systemPackages = with pkgs; [
    docker-compose
    dive
    lazydocker
  ];
}
