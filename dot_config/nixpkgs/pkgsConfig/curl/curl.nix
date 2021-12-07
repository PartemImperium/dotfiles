{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.curl;
in
{# cli tool to download files
    options.pkgsConfig.curl = {
        enable = mkOption {# Im using mkOption instead of mkEnableOption as you cant set the default of mkEnableOption and until I have all of the modules using options I will pull the defaults out and put them in a install by roles module.
            description = "Whether to enable curl.";
            type = types.bool;
            default = true;
        };
    };
    config = mkIf cfg.enable {
        home.packages = [ pkgs.curl ];
    };
}
