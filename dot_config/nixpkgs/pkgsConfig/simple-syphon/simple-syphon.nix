{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.simple-syphon;
in
{# Silicon Info is a tiny menu bar application allows the user to quickly view the architecture of the currently running application.
    options.pkgsConfig.simple-syphon = {
        enable = mkEnableOption "simple-syphon";

        package = mkOption {
            type = types.package;
            default = pkgs.simple-syphon;
        };
    };
    config = mkIf (cfg.enable) {
        home.packages = [ cfg.package ];
    };
}
