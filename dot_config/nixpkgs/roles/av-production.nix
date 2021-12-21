{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.variables.roles;
    isGui = config.variables.system.isGui;
in
{
    config.pkgsConfig = mkIf cfg.av-production {
        skaarhoj-updater.enable = isGui;
    };
}
