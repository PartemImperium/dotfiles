{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.youtube-dl;
in
{# cli tool to download videos from youtube and other online sites
    options.pkgsConfig.youtube-dl = {
        enable = mkEnableOption "youtube-dl";
    };
    config = mkIf cfg.enable {
        home.packages = [ pkgs.youtube-dl ];
    };
}
