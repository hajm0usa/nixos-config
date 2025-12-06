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
      plugins = [
        pkgs.networkmanager-openvpn
      ];
    };

    nameservers = [
      "4.2.2.4"
      "4.2.2.2"
    ];

    firewall = {
      enable = false;
    };
  };

  services.resolved = {
    enable = true;
    dnssec = "allow-downgrade";
    fallbackDns = [
      "1.1.1.1"
      "8.8.8.8"
    ];
  };

  programs.captive-browser= {
    enable = true;
    interface = "wlo1";
  };
  environment.systemPackages = [ pkgs.networkmanagerapplet ];
}
