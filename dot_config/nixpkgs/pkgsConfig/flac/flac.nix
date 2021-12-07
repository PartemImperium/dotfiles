{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.flac;
in
{# cli tool to encode audio files as flac
    options.pkgsConfig.flac = {
        enable = mkOption {# Im using mkOption instead of mkEnableOption as you cant set the default of mkEnableOption and until I have all of the modules using options I will pull the defaults out and put them in a install by roles module.
            description = "Whether to enable flac.";
            type = types.bool;
            default = config.variables.roles.audio;
        };
    };
    config = mkIf cfg.enable {
        home.packages = [ pkgs.flac ];
    };
}
    