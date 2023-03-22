#########################
# All Extra Filesystems #
#         Damage        #
#########################

# filesystems configure /etc/fstab entries

{ config, pkgs, ... }:

{


  fileSystems."/" =
    { device = "rpool-damage/nixos";
      fsType = "zfs"; options = [ "zfsutil" "X-mount.mkdir" ];
    };

  fileSystems."/home" =
    { device = "rpool-damage/nixos/home";
      fsType = "zfs"; options = [ "zfsutil" "X-mount.mkdir" ];
    };

  fileSystems."/nix" =
    { device = "rpool-damage/nixos/nix";
      fsType = "zfs"; options = [ "zfsutil" "X-mount.mkdir" ];
    };

  fileSystems."/root" =
    { device = "rpool-damage/nixos/root";
      fsType = "zfs"; options = [ "zfsutil" "X-mount.mkdir" ];
    };

  fileSystems."/usr" =
    { device = "rpool-damage/nixos/usr";
      fsType = "zfs"; options = [ "zfsutil" "X-mount.mkdir" ];
    };

  fileSystems."/var" =
    { device = "rpool-damage/nixos/var";
      fsType = "zfs"; options = [ "zfsutil" "X-mount.mkdir" ];
    };

  fileSystems."/boot/efi" =
    { device = "/boot/efis/efiboot0";
      fsType = "none";
      options = [ "bind" ];
    };

  fileSystems."/boot/efis/efiboot0" =
    { device = "/dev/disk/by-uuid/0F6E-9A01";
      fsType = "vfat";
    };

  fileSystems."/boot/efis/efiboot1" =
    { device = "/dev/disk/by-uuid/0F70-3844";
      fsType = "vfat";
    };

  swapDevices = [ ];

  # Start NFS Shares Config
  fileSystems."/mnt/nfs/john" = {
    device = "nas.haines.work:/mnt/NAS/John";
    fsType = "nfs4";
  };

  fileSystems."/mnt/nfs/books" = {
    device = "nas.haines.work:/mnt/NAS/Books";
    fsType = "nfs4";
  };

  fileSystems."/mnt/nfs/music" = {
    device = "nas.haines.work:/mnt/NAS/Music";
    fsType = "nfs4";    
  };

  fileSystems."/mnt/nfs/Photos" = {
    device = "nas.haines.work:/mnt/NAS/Photos";
    fsType = "nfs4";
  };
  # End NFS Shares Config
}

