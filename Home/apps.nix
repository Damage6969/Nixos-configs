################################
# All System-wide Applications #
#            Damage            #
################################

{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    acpid
    bottles
    connman
    f3
    fahcontrol
#    fio
    inetutils
    intel-media-driver
    intel-ocl
    lm_sensors
    lutris
    mesa
    microcodeAmd
    networkmanagerapplet
    nix-output-monitor
    nvme-cli
    ocl-icd # OpenCL ICD Loader for opencl-headers for FAH
    oxygenfonts
    plexamp
    process-viewer
    psensor
    radeontop
    sanoid
    smartmontools
    spotify
    tailscale
    thunderbird
    usbimager
    zenmonitor

    # KDE Apps

    kde-rounded-corners
    kdiskmark

    # Rust Apps
    rustdesk # Move to user when unfree sorted

    #Wine Apps
    winetricks
    wineWowPackages.waylandFull

    #ZFS Apps

    zfs-autobackup
    zfs-prune-snapshots
    zpool-iostat-viz

    # Libraries

    enlightenment.efl # Enlightenment Foundation Libraries
    enlightenment.econnman

    libaacs
    libbdplus
    libbluray
  ];
}

