{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.nano;
in
{# cli text editor
    options.pkgsConfig.nano = {
        enable = mkEnableOption "nano";

        package = mkOption {
            type = types.package;
            default = pkgs.nano;
        };
    };
    config = mkIf cfg.enable {
        home.packages = [ cfg.package ];
    };
}
