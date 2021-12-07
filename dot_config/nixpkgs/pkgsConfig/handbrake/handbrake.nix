{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.handbrake;
in
{# video encoder
    options.pkgsConfig.handbrake = {
        enable = mkEnableOption "handbrake";
    };
    config = mkIf (cfg.enable && false) {#TODO: remove this hard false and figure out why it isnt building for me
        home.packages = [ pkgs.handbrake ];
    };
}
    