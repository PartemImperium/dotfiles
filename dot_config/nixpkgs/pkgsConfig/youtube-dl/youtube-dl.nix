{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.youtube-dl;
in
{# cli tool to download videos from youtube and other online sites
    options.pkgsConfig.youtube-dl = {
        enable = mkEnableOption "youtube-dl";

        package = mkOption {
            type = types.package;
            default = pkgs.youtube-dl;#TODO: Look into swapping to yt-dlp (it is apperently better maintained.)
        };
    };
    config = mkIf cfg.enable {
        home.packages = [ cfg.package ];
    };
}
