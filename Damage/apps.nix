################################
# All System-wide Applications #
#            Damage            #
################################

{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bottles
    connman
    jellyfin-media-player
    lutris
    mesa
    microcodeAmd
    ocl-icd # OpenCL ICD Loader for opencl-headers for FAH
    protontricks
    protonup-qt
    psensor
    radeontop
    spotify
    thunderbird
    zenmonitor

    # KDE Apps

    kde-rounded-corners
    kdiskmark

    #Wine Apps
    winetricks
    wineWowPackages.waylandFull
  ];
}

