{ config, pkgs, ... }:

{

  imports = [ ./fonts.nix ];

  # Enable the GNOME Desktop Environment.
  services = {
    gnome = {
      games.enable = true;
    };
    xserver = {
      enable = true;
      layout = "gb";
      videoDrivers = [ "amdgpu" ];
      desktopManager = {
        enlightenment.enable = true;
        gnome.enable = true;
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

  programs.nm-applet.indicator = true;

  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
  ]) ++ (with pkgs.gnome; [ #Below is the exclude list
    cheese # webcam tool
    gnome-music
    gnome-terminal
    gdm
    gedit # text editor
    epiphany # web browser
    geary # email reader
    evince # document viewer
    gnome-characters
    totem # video player
    tali # poker game
    iagno # go game
    hitori # sudoku game
    atomix # puzzle game
  ]);

  environment.systemPackages = with pkgs; [
    gnome.adwaita-icon-theme

    gnome.gnome-boxes
    gnome.gdm
    gnome.gnome-logs
    gnome.gnome-maps
    gnome-recipes
    gnome.seahorse

    gnome.gnome-shell-extensions
    gnome.gnome-tweaks
    gnome.gnome-user-share

# Commented out options not compatible with current version of Gnome
    
    gnomeExtensions.alternate-menu-for-hplip2
    gnomeExtensions.appindicator
    gnomeExtensions.burn-my-windows
    gnomeExtensions.clipman
    gnomeExtensions.dash-to-dock
    gnomeExtensions.desktop-cube
    gnomeExtensions.focus
    gnomeExtensions.freon
    gnomeExtensions.gnome-40-ui-improvements
    gnomeExtensions.gradient-top-bar
    gnomeExtensions.gsconnect
    gnomeExtensions.harddisk-led
    gnomeExtensions.openweather
    gnomeExtensions.order-gnome-shell-extensions
    gnomeExtensions.moon-phases
    gnomeExtensions.printers
    gnomeExtensions.rounded-corners
    gnomeExtensions.simple-timer
    gnomeExtensions.tailscale-status
    gnomeExtensions.transparent-window-moving
    gnomeExtensions.user-themes
    gnomeExtensions.wifi-qrcode
    gnomeExtensions.wayland-or-x11
    gnomeExtensions.webfeed
    gnomeExtensions.window-state-manager
  ];
}
