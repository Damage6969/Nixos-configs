###########################################
# Machine Specific Services Configuration #
#                  Damage                 #
###########################################

{ config, pkgs, ... }:

{
  services = {
    clamav = {
      daemon.enable = true;
      updater.enable = true;
    };

    foldingathome = {
      enable = true;
      user = "Damage";
      team = 242858;
    };

    fwupd.enable = true;

    hardware.openrgb = {
      enable = true;
      motherboard = "amd";
    };

    openssh = {
      enable = true;
      settings.PermitRootLogin = "yes";
#      permitRootLogin = "yes";
      hostKeys = [{
        path = "/etc/ssh/ssh_host_ed25519_key";
        type = "ed25519";
      }];
    };

    printing = {
      enable = true;
      drivers = [ pkgs.hplipWithPlugin ];
    };

    tailscale.enable = true;

    teamviewer.enable = true;

    udev.packages = with pkgs;
      [ gnome.gnome-settings-daemon ];

    zfs = {
      autoScrub.enable = true;
      trim.enable = true;
    };
  };
}
