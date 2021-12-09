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

            settings = {
                window = {
                    dynamic_title = true;
                };
                scrolling = {
                    history = 10000; #TODO: Make a general teminal config and use it both here and in vscode's integrated terminal
                };
                font = {
                    normal =  {
                        family = "Hack Nerd Font Mono";
                    };
                    "use_thin_strokes" = true;
                };
            };
        };
    };
}
    