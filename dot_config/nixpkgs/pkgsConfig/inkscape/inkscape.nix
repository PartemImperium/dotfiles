{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.inkscape;
in
{# free vector graphics editor
    options.pkgsConfig.inkscape = {
        enable = mkEnableOption "inkscape";
    };
    config = mkIf (cfg.enable && false) {#TODO: remove this hard false and figure out why it isnt building for me
        home.packages = [ pkgs.inkscape ];
    };
}
    