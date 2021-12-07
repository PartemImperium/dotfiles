{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.variables.roles;
    isGui = config.variables.system.isGui;
in
{
    config.pkgsConfig = mkIf cfg.image {
        gimp.enable = isGui;
        inkscape.enable = isGui;
    };
}
    