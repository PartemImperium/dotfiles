{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.alacritty;
in#TODO: Find out why/make it launch a new instace every time opened
{# Terminal emulator that works cross platform.
    options.pkgsConfig.alacritty = {
        enable = mkEnableOption "alacritty";

        package = mkOption {
            type = types.package;
            default = pkgs.alacritty;
        };
    };
    config = mkIf cfg.enable {
        programs.alacritty = {
            enable = true;
            package = cfg.package;

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
    