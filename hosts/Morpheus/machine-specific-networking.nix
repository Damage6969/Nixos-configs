##########################################
# Machine Specific Network Configuration #
#                 Damage                 #
##########################################

{ config, pkgs, ... }:

{
  networking = { 
    hostId = "7c9143bf";
    hostName = "Damage";
    search = [ "haines.work" ];
#    useDHCP = lib.mkDefault true;
    useDHCP = false;
    networkmanager = {
      enable = true;
      unmanaged = [ "tailscale0" "enp13s0f0" "enp13s0f1" ];
    };

    bonds = {
      bond0 = {
        interfaces = [ "enp13s0f0" "enp13s0f1" ];
        driverOptions = {
          fail_over_mac = "follow";
          miimon = "100";
          mode = "802.3ad";
          lacp_rate = "slow";
          xmit_hash_policy = "layer2+3";
        };
      };
    };

    interfaces = {
      enp13s0f0.useDHCP = false;
      enp13s0f1.useDHCP = false;
      bond0.useDHCP = true;
      wlp6s0.useDHCP = true;
    };
  };
}

