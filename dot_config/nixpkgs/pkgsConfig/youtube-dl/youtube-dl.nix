{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.youtube-dl;
in
{# cli tool to download videos from youtube and other online sites
    options.pkgsConfig.youtube-dl = {
        enable = mkOption {# Im using mkOption instead of mkEnableOption as you cant set the default of mkEnableOption and until I have all of the modules using options I will pull the defaults out and put them in a install by roles module.
            description = "Whether to enable youtube-dl.";
            type = types.bool;
            default = config.variables.roles.video;
        };
    };
    config = mkIf cfg.enable {
        home.packages = [ pkgs.youtube-dl ];
    };
}
