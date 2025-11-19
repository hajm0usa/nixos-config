{ config, pkgs, ... }:

{
  networking = {
    networkmanager = {
      enable = true;
      connectionConfig = {
        "connectivity.enabled" = true;
        "connectivity.uri" = "http://connectivitycheck.gstatic.com/generate_204";
      };     
      wifi.powersave = false;
    };

    nameservers = [
      "4.2.2.4"
      "4.2.2.2"
    ];

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
