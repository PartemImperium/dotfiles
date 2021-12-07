{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.alacritty;
in
{# Terminal emulator that works cross platform.
    options.pkgsConfig.alacritty = {
        enable = mkEnableOption "alacritty";
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
    