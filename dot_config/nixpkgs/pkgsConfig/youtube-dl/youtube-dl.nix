{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.youtube-dl;
in
{# cli tool to download videos from youtube and other online sites
    options.pkgsConfig.youtube-dl = {
        enable = mkEnableOption "youtube-dl";
    };
    config = mkIf cfg.enable {#TODO: Look into swapping to yt-dlp (it is apperently better maintained.)
        home.packages = [ pkgs.youtube-dl ];
    };
}
