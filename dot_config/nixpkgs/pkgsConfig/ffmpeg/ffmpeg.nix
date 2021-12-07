{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.ffmpeg;
in
{# video encoder
options.pkgsConfig.ffmpeg = {
        enable = mkOption {# Im using mkOption instead of mkEnableOption as you cant set the default of mkEnableOption and until I have all of the modules using options I will pull the defaults out and put them in a install by roles module.
                description = "Whether to enable ffmpeg.";
                type = types.bool;
                default = config.variables.roles.video;
            };
    };
    config = mkIf cfg.enable {
        home.packages = [ pkgs.ffmpeg ];
    };
}
    