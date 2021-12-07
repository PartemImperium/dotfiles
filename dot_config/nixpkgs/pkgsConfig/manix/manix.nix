{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.manix;
in
{# man tool for nix options (across nix, home-manager, ect)
    options.pkgsConfig.manix = {
        enable = mkEnableOption "manix";
    };
    config = mkIf cfg.enable {
        home.packages = [ pkgs.manix ];
    };
}
    