{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.glow;
in
{# cli markdown renderer
    options.pkgsConfig.glow = {
        enable = mkEnableOption "glow";
    };
    config = mkIf cfg.enable {
        home.packages = [ pkgs.glow ];
    };
}
    