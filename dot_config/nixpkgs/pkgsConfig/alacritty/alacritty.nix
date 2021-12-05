{ pkgs, lib, ... }:
let 
    vars = import ../../variables.nix;
    isEnabled = vars.isGui;# This is just a direct assingment here but others may have more logic and keeping things standardized makes it easier to work with.
in
{# Terminal emulator that works cross platform.
    
        programs.alacritty = {
            enable = isEnabled;

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
    
    home.packages = lib.lists.optionals isEnabled [ pkgs.alacritty ];
}
    