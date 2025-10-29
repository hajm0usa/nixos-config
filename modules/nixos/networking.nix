{ config, pkgs, ... }:

{
  networking = {
    networkmanager = {
      enable = true;
      wifi.powersave = false;
    };

    # firewall = {
    #   enable = true;
    #   allowedTCPPorts = [ ];
    #   allowedUDPPorts = [ ];
    # };
  };

  services.resolved = {
    enable = true;
    dnssec = "allow-downgrade";
    fallbackDns = [
      "1.1.1.1"
      "8.8.8.8"
    ];
  };

  environment.systemPackages = [ pkgs.networkmanagerapplet ];
}
