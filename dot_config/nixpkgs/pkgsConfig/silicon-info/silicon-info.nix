{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.silicon-info;
in
{# Silicon Info is a tiny menu bar application allows the user to quickly view the architecture of the currently running application.
    options.pkgsConfig.silicon-info = {
        enable = mkEnableOption "silicon-info";
    };
    config = mkIf (cfg.enable) {
        home.packages = [ pkgs.silicon-info ];
    };
}
