{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.glow;
in
{# cli markdown renderer
    options.pkgsConfig.glow = {
        enable = mkEnableOption "glow";

        package = mkOption {
            type = types.package;
            default = pkgs.glow;
        };
    };
    config = mkIf cfg.enable {
        home.packages = [ cfg.package ];
    };
}
    