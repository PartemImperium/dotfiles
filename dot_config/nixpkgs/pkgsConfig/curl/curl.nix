{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.curl;
in
{# cli tool to download files
    options.pkgsConfig.curl = {
        enable = mkEnableOption "curl";

        package = mkOption {
            type = types.package;
            default = pkgs.curl;
        };
    };
    config = mkIf cfg.enable {
        home.packages = [ cfg.package ];
    };
}
