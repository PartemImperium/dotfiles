{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.alacritty;
in
{# Terminal emulator that works cross platform.
    options.pkgsConfig.alacritty = {
        enable = mkOption {# Im using mkOption instead of mkEnableOption as you cant set the default of mkEnableOption and until I have all of the modules using options I will pull the defaults out and put them in a install by roles module.
            description = "Whether to enable alacritty.";
            type = types.bool;
            default = config.variables.system.isGui;
        };
    };
    config = mkIf cfg.enable {
        programs.alacritty = {
            enable = true;

            # TODO: Change the theme to be more how I would want it. The default isnt bad but not the best.
            settings = {
                font = {
                    normal =  {
                        family = "Hack Nerd Font Mono";
                    };
                    "use_thin_strokes" = true;
                };
            };
        };
    
        home.packages = [ pkgs.alacritty ];#TODO: Check if this is needed. Im pretty sure setting the home manager module to enabled will install it
    };
}
    