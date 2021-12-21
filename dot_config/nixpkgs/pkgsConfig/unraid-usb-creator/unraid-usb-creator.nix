{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.unraid-usb-creator;
in
{# Software to create a bootable unraid USB
    options.pkgsConfig.unraid-usb-creator = {
        enable = mkEnableOption "unraid-usb-creator";

        package = mkOption {
            type = types.package;
            default = pkgs.unraid-usb-creator;
        };
    };
    config = mkIf (cfg.enable) {
        home.packages = [ cfg.package ];
    };
}
