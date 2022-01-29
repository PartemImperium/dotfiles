{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.package-modules.nodejs;
in
{
    options.package-modules.nodejs = {
        enable = mkEnableOption "nodejs";

        package = mkOption {
            type = types.package;
            default = pkgs.nodejs;
        };
    };
    config = mkIf cfg.enable {
        home.packages = [ cfg.package ];
    };
}
