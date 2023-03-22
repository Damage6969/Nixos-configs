{ inputs, lib, config, pkgs, ... }:

{
#  virtualisation.oci-containers = {
#    backend = "podman";
#    containers.homeassistant = {
#      volumes = [ "home-assistant:/config" ];
#      environment.TZ = "America/New_York";
#      image = "ghcr.io/home-assistant/home-assistant:stable"; # Warning: if the tag does not change, the image will not be updated
#      extraOptions = [ 
#        "--network=host" 
#        "--device=/dev/ttyACM0:/dev/ttyACM0"  # Example, change this to match your own hardware (I don't have any yet)
#      ];
#    };
#  };

  services.home-assistant = {
    enable = true;
    extraComponents = [
      # Components required to complete the onboarding
      "met"
      "radio_browser"
      "backup"
    ];
    config = {
      # Includes dependencies for a basic setup
      # https://www.home-assistant.io/integrations/default_config/
      default_config = {};
    };
  };
}
