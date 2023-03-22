#######################
# User specific Items #
#       Damage        #
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
        ace-of-penguins
        amdfwtool
	anbox
        bitwarden
        brave
        calibre
        clipgrab
        darktable
        difftastic
        discord
        drawio
        dig
        dupeguru
        electron-mail
        element-desktop
        elisa
        exa
        fd
        fdupes
        fish
        fishPlugins.bass
        fishPlugins.colored-man-pages
        fishPlugins.tide
        freeplane
        gosmore
        gwenview
        handbrake
        haruna
        heroic
        hyprpaper
        jitsi-meet
        joplin
        kitty
        lfs
        libreoffice-fresh
        light
        nix-query-tree-viewer
        nushell
        nvd
        obs-studio
        obs-studio-plugins.obs-vkcapture
        obsidian
        ocl-icd
        okular
        openarena
        openrgb
        protonmail-bridge
        protonvpn-gui
        qmetro
        ryzenadj
        signal-desktop
        testdisk-qt
        vlc
        vkquake
        zenstates
        zoxide
        sd-switch
        tellico

        # Rust Apps
        du-dust
        dutree
        rust-motd
        rustscan

        # Wine Apps
        winetricks
        wineWowPackages.waylandFull

        # Enlightenment Apps

        enlightenment.ephoto
        enlightenment.evisum
        enlightenment.terminology

        # KDE Apps

        libsForQt5.kdeconnect-kde
        libsForQt5.kdeplasma-addons
        libsForQt5.kitinerary
        libsForQt5.libkdegames
        libsForQt5.neochat
        akregator
        kaffeine
        kmines
        kshisen
        marble
        wacomtablet
      ];
    };
  };
}
