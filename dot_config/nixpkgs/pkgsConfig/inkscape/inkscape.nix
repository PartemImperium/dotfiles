{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.inkscape;
in
{# free vector graphics editor
    options.pkgsConfig.inkscape = {
        enable = mkEnableOption "inkscape";
    };
    config = mkIf (cfg.enable) {
        #TODO: Look into https://gitlab.com/inkscape/inkscape/-/issues/2291 and https://gitlab.com/inkscape/inkscape/-/blob/82801abe77a62fba25636074254bf468a2ffd3cb/src/shortcuts.cpp#L676 to fix launch issue
        home.packages = [ pkgs.inkscape ];
    };
}
    