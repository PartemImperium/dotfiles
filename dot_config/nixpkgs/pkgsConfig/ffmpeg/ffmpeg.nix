{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.ffmpeg;
in
{# video encoder
options.pkgsConfig.ffmpeg = {
        enable = mkEnableOption "ffmpeg";
    };
    config = mkIf cfg.enable {
        home.packages = [ pkgs.ffmpeg ];
    };
}
    