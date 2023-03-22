##################################
# Machine Specific Configuration #
#             Damage             #
##################################

{ config, lib, pkgs, modulesPath, ... }:

{
  # Include the results of the hardware scan.
  imports = [ 
    ./machine-specific-networking.nix
    ./machine-specific-security.nix
    ./machine-specific-services.nix
#    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  systemd.tmpfiles.rules = [
      "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.hip}"
    ];

  hardware = {
    acpilight.enable = true;
    bluetooth.enable = true;
    cpu.amd = {
#      updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
      updateMicrocode = true;
      sev.enable = true;
    };
    i2c.enable = true;
    opengl = {
      enable = true;
      driSupport = true;
      extraPackages = with pkgs; [
        mesa.drivers
        rocm-opencl-icd
        rocm-opencl-runtime
        rocm-runtime
        vaapiVdpau
        amdvlk
      ];
    };

    opentabletdriver.enable = true;

    pulseaudio.enable = false;

    sane = {
      enable = true;
      openFirewall = true;
      extraBackends = [ pkgs.hplipWithPlugin ];
    };

#    video.hidpi.enable = lib.mkDefault true;
    video.hidpi.enable = true; 
  };

  programs = {
    corectrl.gpuOverclock.ppfeaturemask = "0xfffd7fff"; # Default is 0xfffd7fff
    dconf.enable = true;
    steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Re>
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Sou>
    };
  };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };

  environment.etc = {
    "wireplumber/bluetooth.lua.d/51-bluez-config.lua".text = ''
      bluez_monitor.properties = {
        ["bluez5.enable-sbc-xq"] = true,
        ["bluez5.enable-msbc"] = true,
        ["bluez5.enable-hw-volume"] = true,
        ["bluez5.headset-roles"] = "[ hsp_hs hsp_ag hfp_hf hfp_ag ]"
      }
    '';
  };
  programs.light.enable = true;
}

