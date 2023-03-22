##################################
# Machine Specific Configuration #
#             Damage             #
##################################

{ lib, config, pkgs, ... }:

{
#  hardware =
#    let
#      printerName = "HP_7640";
#      hostName = "printer.haines.work";
#    in
#    {
#      printers = {
#        ensureDefaultPrinter = printerName;
#        ensurePrinters = [
#          {
#            name = printerName;
#            deviceUri = "ipp://${hostName}/ipp";
#            model = "everywhere";
#            description = lib.replaceStrings [ "_" ] [ " " ] printerName;
#            location = "Upstairs";
#          }
#        ];
#      };
#    };
}
