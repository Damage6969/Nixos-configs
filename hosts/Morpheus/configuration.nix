{ input, lib, config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan and other config files.
      ./apps.nix
      ./boot.nix
      ./desktop-environment.nix
      ./filesystems.nix
      ./hardware-configuration.nix
      ./machine-specific.nix
      ./printers.nix
      ./protonmail-bridge.nix
#      ./themes.nix
      ./users.nix
    ];

  environment.defaultPackages = [ pkgs.nano ]; #Clean slate on installed packages

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 45d";
    };
  };

  system.autoUpgrade = {
    enable = true;
    channel = https://nixos.org/channels/nixos-22.11;
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = (_: true);
  };

  virtualisation = {
    waydroid.enable = true;
    lxd.enable = true;
  };

  # Set your time zone.
  time.timeZone = "America/New_York";

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?
}

