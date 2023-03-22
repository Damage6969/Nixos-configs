{ config, pkgs, ... }:

{
  boot = {
    binfmt.emulatedSystems = [ "aarch64-linux" ];
    extraModulePackages = [ ];
    kernelModules = [ "kvm-amd" "i2c-dev" "i2c-piix4" "ixgbe" "amdgpu" ]; # May need i2c modules for OpenRGB>
    kernelPackages = config.boot.zfs.package.latestCompatibleLinuxPackages;
    kernelParams = ["quiet" "nohibernate" ];
    initrd = {
      kernelModules = [ "ixgbe" ];
      availableKernelModules = [ "nvme" "xhci_pci" "usbhid" "usb_storage" "sd_mod" "ahci" "uas" "sr_mod" "ixgbe" ];
      network = {
        # This will use udhcp to get an ip address.
        # Make sure you have added the kernel module for your network driver to `boot.initrd.availableKernelModules`,
        # so your initrd can load it!
        # Static ip addresses might be configured using the ip argument in kernel command line:
        # https://www.kernel.org/doc/Documentation/filesystems/nfs/nfsroot.txt
        enable = true;
        ssh = {
          enable = true;
          # To prevent ssh clients from freaking out because a different host key is used,
          # a different port for ssh is useful (assuming the same host has also a regular sshd running)
          port = 2222;
          # hostKeys paths must be unquoted strings, otherwise you'll run into issues with boot.initrd.secrets
          # the keys are copied to initrd from the path specified; multiple keys can be set
          # you can generate any number of host keys using
          hostKeys = [
            /etc/secrets/initrd/ssh_host_ed_25519_key
          ];
          # public ssh key used for login
          authorizedKeys = [ "/etc/secrets/initrd/ssh_host_ed_25519_key.pub" ];
        };
      };
    };
    supportedFilesystems = [ "zfs" "ntfs" ];
    zfs.devNodes = "/dev/disk/by-partlabel";
    
    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
      systemd-boot = {
        enable = true;
        configurationLimit = 30;
        consoleMode = "auto";
        memtest86.enable = true;
        extraEntries =
          { "memtest86.conf" = ''
            title MemTest86
            efi /efi/memtest86/memtest86.efi
          '';
          };
      };
    };

#    plymouth.enable = true;
  };
}
