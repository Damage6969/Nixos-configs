##########################################
# Machine Specific Network Configuration #
#                  Home                  #
##########################################

{ config, pkgs, ... }:

{
  networking = {
    hostId = "52cd555e";
    hostName = "Home";
    search = [ "haines.work" ];
    useDHCP = false;
    networkmanager = {
      enable = true;
    };
  };
}
