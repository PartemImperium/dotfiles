{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.variables.roles;
    isGui = config.variables.system.isGui;
in
{
    config.pkgsConfig = mkIf cfg.video {
        ffmpeg.enable = true;
        handbrake.enable = true;
        makemkv.enable = true;
        youtube-dl.enable = true;
    };
}
