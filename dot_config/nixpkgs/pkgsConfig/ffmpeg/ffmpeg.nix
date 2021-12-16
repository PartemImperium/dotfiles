{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.ffmpeg;
in
{# video encoder
options.pkgsConfig.ffmpeg = {
        enable = mkEnableOption "ffmpeg";

        package = mkOption {
            type = types.package;
            default = pkgs.ffmpeg;
        };
    };
    config = mkIf cfg.enable {
        home.packages = [ cfg.package ];
    };
}
    