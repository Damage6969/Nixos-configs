{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    libaacs
    libbdplus
    libbluray
  ];
}

