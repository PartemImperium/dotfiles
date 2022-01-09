{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.stats;
in
{# macOS system monitor in your menu bar
    options.pkgsConfig.stats = {
        enable = mkEnableOption "stats";

        package = mkOption {
            type = types.package;
            default = pkgs.stats;
        };
    };
    config = mkIf cfg.enable {
        home.packages = [ cfg.package ];
    };
}
