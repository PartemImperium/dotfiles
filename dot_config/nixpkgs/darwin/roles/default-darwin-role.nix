{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.variables.roles;
    isGui = config.variables.system.isGui;
in
{
    config.pkgsConfig = {#TODO: Possibly move this to the normal roles folder and do a if on isDarwin
        silicon-info.enable = isGui;
        keycodes.enable = isGui;
        stats.enable = isGui;
    };
}
