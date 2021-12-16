{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.flac;
in
{# cli tool to encode audio files as flac
    options.pkgsConfig.flac = {
        enable = mkEnableOption "flac";

        package = mkOption {
            type = types.package;
            default = pkgs.flac;
        };
    };
    config = mkIf cfg.enable {
        home.packages = [ cfg.package ];
    };
}
    