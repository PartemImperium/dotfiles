{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.projects.led-wall-mapper;
in
{
    options.projects.led-wall-mapper = {
        enable = mkEnableOption "LedWallMapper";
    };
    config = mkIf cfg.enable {
        pkgsConfig = {
            #TODO: Look into the Requirements for running this out of vsc instead of xcode.
        };
        activation.gitCloner.repos = [ https://github.com/PartemImperium/LedPanelMapper.git ];
    };
}
