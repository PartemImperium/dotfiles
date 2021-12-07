{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.flac;
in
{# cli tool to encode audio files as flac
    options.pkgsConfig.flac = {
        enable = mkEnableOption "flac";
    };
    config = mkIf cfg.enable {
        home.packages = [ pkgs.flac ];
    };
}
    