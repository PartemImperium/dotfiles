{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.makemkv;
in
{# bluray ripping tool 
    options.pkgsConfig.makemkv = {
        enable = mkEnableOption "makemkv";
    };
    config = mkIf (cfg.enable && false) {#TODO: remove this hard false and figure out why it isnt building for me
        home.packages = [ pkgs.makemkv ];
    };
    #TODO: Get config all set up for this one    
}
    