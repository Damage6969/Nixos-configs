{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    acpid
    corectrl
    f3
    fio
    git
    git-hub
    gitui
    inetutils
    iperf
    lm_sensors
    magic-wormhole
    nix-output-monitor
    ntfs3g
    nvme-cli
    pciutils
    sanoid
    smartmontools
    usbutils
    
    #ZFS Apps

    zfs-autobackup
    zfs-prune-snapshots
    zpool-iostat-viz
  ];
}

