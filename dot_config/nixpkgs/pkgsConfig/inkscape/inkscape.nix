{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.inkscape;
in
{# free vector graphics editor
    options.pkgsConfig.inkscape = {
        enable = mkOption {# Im using mkOption instead of mkEnableOption as you cant set the default of mkEnableOption and until I have all of the modules using options I will pull the defaults out and put them in a install by roles module.
            description = "Whether to enable inkscape.";
            type = types.bool;
            default = config.variables.roles.image
                   && config.variables.system.isGui;
        };
    };
    config = mkIf (cfg.enable && false) {#TODO: remove this hard false and figure out why it isnt building for me
        home.packages = [ pkgs.inkscape ];
    };
}
    