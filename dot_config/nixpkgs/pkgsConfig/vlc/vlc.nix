{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.vlc;
in
{# audio and video player 
    options.pkgsConfig.vlc = {
        enable = mkOption {# Im using mkOption instead of mkEnableOption as you cant set the default of mkEnableOption and until I have all of the modules using options I will pull the defaults out and put them in a install by roles module. TODO: Lets not anymore....
            description = "Whether to enable vlc.";
            type = types.bool;
            default = true #TODO: Figure out what role to put this in... I want it on almost everything but work computer doesnt need VLC 
                   && config.variables.system.isGui;
        };

        package = mkOption {
            type = types.package;
            default = pkgs.vlc;
        };
    };
    config = mkIf (cfg.enable && false) {#TODO: remove this hard false and figure out why it isnt building for me
        home.packages = [ cfg.package ];
    };
}
    