{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.skaarhoj-updater;
in
{# Software to update the firmware on skaarhoj hardware
    options.pkgsConfig.skaarhoj-updater = {
        enable = mkEnableOption "skaarhoj-updater";

        package = mkOption {
            type = types.package;
            default = pkgs.skaarhoj-updater;
        };
    };
    config = mkIf (cfg.enable) {
        home.packages = [ cfg.package ];
    };
}
