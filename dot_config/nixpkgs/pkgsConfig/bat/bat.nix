{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.bat;
in
{# cat clone on steroids
    options.pkgsConfig.bat = {
        enable = mkEnableOption "bat";
    };
    config = mkIf cfg.enable {
        home.packages = [ pkgs.bat ];
    };
}#TODO: Start figure out what config bat has and set it up here
    