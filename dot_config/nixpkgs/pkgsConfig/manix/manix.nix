{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.manix;
in
{# man tool for nix options (across nix, home-manager, ect)
    options.pkgsConfig.manix = {
        enable = mkOption {# Im using mkOption instead of mkEnableOption as you cant set the default of mkEnableOption and until I have all of the modules using options I will pull the defaults out and put them in a install by roles module.
            description = "Whether to enable manix.";
            type = types.bool;
            default = true;
        };
    };
    config = mkIf cfg.enable {
        home.packages = [ pkgs.manix ];
    };
}
    