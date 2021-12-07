{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.curl;
in
{# cli tool to download files
    options.pkgsConfig.curl = {
        enable = mkEnableOption "curl";
    };
    config = mkIf cfg.enable {
        home.packages = [ pkgs.curl ];
    };
}
