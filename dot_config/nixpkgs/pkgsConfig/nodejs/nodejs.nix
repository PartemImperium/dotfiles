{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.nodejs;
in
{# js engine
    options.pkgsConfig.nodejs = {
        enable = mkEnableOption "nodejs";

        package = mkOption {
            type = types.package;
            default = pkgs.nodejs;
        };
    };
    config.package-modules.nodejs = mkIf cfg.enable {
        enable = true;
        package = cfg.package;
    };
}
