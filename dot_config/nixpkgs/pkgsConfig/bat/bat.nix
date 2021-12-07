{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.bat;
in
{# cat clone on steroids
    options.pkgsConfig.bat = {
        enable = mkOption {# Im using mkOption instead of mkEnableOption as you cant set the default of mkEnableOption and until I have all of the modules using options I will pull the defaults out and put them in a install by roles module.
                description = "Whether to enable bat.";
                type = types.bool;
                default = true;
            };
    };
    config = mkIf cfg.enable {
        home.packages = [ pkgs.bat ];
    };
}#TODO: Start figure out what config bat has and set it up here
    