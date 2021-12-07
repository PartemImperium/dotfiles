{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.nano;
in
{# cli text editor
    options.pkgsConfig.nano = {
        enable = mkEnableOption "nano";
    };
    config = mkIf cfg.enable {
        home.packages = [ pkgs.nano ];
    };
}
