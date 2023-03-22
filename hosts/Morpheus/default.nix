# #
##
##  per-host configuration for exampleHost
##
##

{ system, pkgs, ... }: {
  my = {
    boot = {
      inherit system;
      devNodes = "/dev/disk/by-id/";
      bootDevices = [  "nvme-Samsung_SSD_970_EVO_Plus_2TB_S4J4NG0M404666A" "nvme-Samsung_SSD_970_EVO_Plus_2TB_S59CNG0MA00044E" ];
      immutable = false;
      hostId = "2c329354";
      availableKernelModules = [
        # for booting virtual machine
        # with virtio disk controller
        "virtio_pci"
        "virtio_blk"
        # for sata drive
        "ahci"
        # for nvme drive
        "nvme"
        # for external usb drive
        "uas"
      ];
      # install bootloader to fallback location
      # set to "false" if multiple systems are installed
      removableEfi = true;
    };

    users = {
      root = {
        # generate hash with:
        # mkpasswd -m SHA-512 -s
        # set hash to "!" to disable login
        initialHashedPassword = "$6$9zPyd8l9k7xrsSkm$.mBL5lwB6KV8Qtr2rWdZBOIyT/FXFlRakeSSoD.ybjAKPilWMfrrhiLsltEPD/gMP8XpD8GpG8P0hkc9Dz98B1";

        authorizedKeys = [ "sshKey_placeholder" ];
        isSystemUser = true;
      };

      my-user = {
        initialHashedPassword = "!";
        description = "J. Magoo";
        extraGroups = [ "wheel" ];
        packages = with pkgs; [ mg nixfmt ];
        isNormalUser = true;
      };
    };
    networking = {
      # also update host name in $REPO/flake.nix
      # and update import path to $REPO/hosts/myHostName
      hostName = "Morpheus";
      timeZone = "America/New_York";
      wirelessNetworks = { "MI6" = "Quickstreet007!"; };
    };

    # enable sway, a tiling Wayland window manager
    # Usage:
    #   Step: change "false" to "true".
    #   Step: add a normal user, see above.
    #   Step: generate and set password hash for the new user.
    #   Step: apply configuration, then reboot.
    #   Step: after reboot, at text console, login as normal user.
    #   Step: enter "sway" command then press "Return".
    programs = { sway.enable = false; };
  };
}
