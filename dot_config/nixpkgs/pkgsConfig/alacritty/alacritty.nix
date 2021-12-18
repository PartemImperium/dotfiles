{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.alacritty;
in
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
                    history = config.pkgsConfig.shared.terminal.lineBufferSize;
                };
                font = {
                    normal =  {
                        family = config.pkgsConfig.shared.terminal.font;
                    };
                    "use_thin_strokes" = true;
                };
            };
        };
    };
}
    