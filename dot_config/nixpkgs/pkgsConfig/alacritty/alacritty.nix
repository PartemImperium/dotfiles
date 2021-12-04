{ pkgs, lib, ... }:
let 
    vars = import ../../variables.nix;
in
{# Terminal emulator that works cross platform.
    
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
    
    home.packages = lib.lists.optionals vars.isGui [ pkgs.alacritty ];
}
    