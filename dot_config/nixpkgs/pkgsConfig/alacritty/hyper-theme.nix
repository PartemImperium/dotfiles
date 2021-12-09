{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.alacritty;
in
{# Theme found from https://github.com/eendroroy/alacritty-theme/blob/master/themes/hyper.yaml
    config = mkIf cfg.enable {
        programs.alacritty = {
            settings = {
                colors = {
                    primary = {
                        background = "0x000000";
                        foreground = "0xffffff";
                    };

                    cursor = {
                        text = "0xF81CE5";
                        cursor = "0xffffff";
                    };

                    normal = {
                        black = "0x000000";
                        red = "0xfe0100";
                        green = "0x33ff00";
                        yellow = "0xfeff00";
                        blue = "0x0066ff";
                        magenta = "0xcc00ff";
                        cyan = "0x00ffff";
                        white = "0xd0d0d0";
                    };

                    bright = {
                        black = "0x808080";
                        red = "0xfe0100";
                        green = "0x33ff00";
                        yellow = "0xfeff00";
                        blue = "0x0066ff";
                        magenta = "0xcc00ff";
                        cyan = "0x00ffff";
                        white = "0xFFFFFF";
                    };
                };
            };
        };
    };
}
    