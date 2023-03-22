#######################
# User specific Items #
#         Home        #
#######################

{ config, lib, pkgs, ... }:

{
  users.users.john = {
    isNormalUser = true;
    description = "Dr John";
    home = "/home/john";
    extraGroups = [ "wheel" "networkmanager" "video" ]; # Enable 'sudo' and Networking.
  };

  users.users.panic = {
    isNormalUser = true;
    description = "Panic Account";
    home = "/home/panic";
    extraGroups = [ "wheel" "networkmanager" "video" ]; # Enable 'sudo' and Networking.
  };

  home-manager.users.john = { pkgs, ... }: {
    programs = {
      fish.enable = true;    
      git = {
        enable = true;
        userName  = "Damage6969";
        userEmail = "j.haines@outlook.com";
      };
    };

    home = {
      stateVersion = "22.11";
      homeDirectory = "/home/john";

      packages = with pkgs; [
        brave
        clipgrab
        difftastic
        dig
        dupeguru
        exa
        fd
        fdupes
        fish
        fishPlugins.bass
        fishPlugins.colored-man-pages
        fishPlugins.tide
        freeplane
        gosmore
        haruna
        hyprpaper
        kitty
        lfs
        nix-query-tree-viewer
        nvd
        ocl-icd
        testdisk
        vlc
        vkquake
        zenstates
        zoxide
        sd-switch

        # Rust Apps
        du-dust
        dutree
        rust-motd
        rustscan

        # Enlightenment Apps

        enlightenment.evisum
        enlightenment.terminology

        # KDE Apps

        libsForQt5.kdeplasma-addons
        libsForQt5.kitinerary
        akregator
        kaffeine
      ];
    };
  };
}
