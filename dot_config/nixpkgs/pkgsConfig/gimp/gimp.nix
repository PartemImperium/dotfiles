{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.gimp;
in
{# free (raster) image editing utility much like photoshop
    options.pkgsConfig.gimp = {
        enable = mkEnableOption "gimp";
    };
    config = mkIf (cfg.enable && false) {#TODO: remove this hard false and figure out why it isnt building for me
        home.packages = [ pkgs.gimp ];
    };
}
    