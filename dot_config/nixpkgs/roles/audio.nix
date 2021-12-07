{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.variables.roles;
    isGui = config.variables.system.isGui;
in
{
    config.pkgsConfig = mkIf cfg.audio {
        flac.enable = true;
        picard.enable = isGui;
    };
}
    