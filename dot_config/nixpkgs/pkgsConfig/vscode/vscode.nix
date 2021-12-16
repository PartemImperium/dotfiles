{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.vscode;
in
{# Text editor on steroids
    options.pkgsConfig.vscode = {
        enable = mkEnableOption "vscode";

        package = mkOption {
            type = types.package;
            default = pkgs.vscode;#TODO: Look into swapping to codeium
        };
    };
    config = mkIf cfg.enable {
        programs.vscode = {
            enable = true;
            package = cfg.package;

            userSettings = {
                "editor.renderWhitespace" = "all";
                "editor.bracketPairColorization.enabled" = true;

                # Minimap Scrollbar settings
                "editor.minimap.enabled" = true;
                "editor.minimap.maxColumn" = 60;
                "editor.minimap.showSlider" = "always";

                # Terminal settings
                "terminal.external.osxExec" = "${pkgs.alacritty}/Applications/Alacritty.app";
                "terminal.external.linuxExec" = "${pkgs.alacritty}/bin/alacritty";
                "terminal.integrated.fontFamily" = "Hack Nerd Font Mono";
            };
        };
    };
}
    