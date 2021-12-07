{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.nano;
in
{# cli text editor
    options.pkgsConfig.nano = {
        enable = mkOption {# Im using mkOption instead of mkEnableOption as you cant set the default of mkEnableOption and until I have all of the modules using options I will pull the defaults out and put them in a install by roles module.
            description = "Whether to enable nano.";
            type = types.bool;
            default = true;
        };
    };
    config = mkIf cfg.enable {
        home.packages = [ pkgs.nano ];
    };
}
