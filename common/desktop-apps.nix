{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bottles
    networkmanagerapplet
    oxygenfonts
    process-viewer
    psensor
    tailscale
    usbimager
  ];
}

