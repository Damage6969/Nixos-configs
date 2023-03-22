{ config, pkgs, ... }:

{
  imports = [ ./fonts.nix ];

  services = {
    xserver = {
      enable = true;
      layout = "gb";
      videoDrivers = [ "amdgpu" ];
      desktopManager = {
        plasma5.enable = true;
      };
      displayManager.sddm = {
        enable = true;
        enableHidpi = true;
        autoNumlock = true;
        theme = "";
      };
    };
  };

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true; # use xkbOptions in tty.
  };
}
