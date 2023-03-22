###########################################
# Machine Specific Security Configuration #
#                  Damage                 #
###########################################

{ config, pkgs, ... }:

{
  # Start Firewall Config
  networking.firewall = {
    # FAHClient 36330 GSConnect 1714-1764
    allowedTCPPorts = [ 36330 ];
    allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
    # Tailscale 41641 GSConnect 1714-1764
    allowedUDPPorts = [ 41641 ];
    allowedUDPPortRanges = [ { from = 1714; to = 1764; } ];
    checkReversePath = "loose";
  };
} # End Firewall Config

