{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.picard;
in
{# audio tagging program
    options.pkgsConfig.picard = {
        enable = mkEnableOption "picard";
    };
    config = mkIf (cfg.enable && false) {#TODO: remove this hard false and figure out why it isnt building for me
        home.packages = [ pkgs.picard ];
    };
}
    