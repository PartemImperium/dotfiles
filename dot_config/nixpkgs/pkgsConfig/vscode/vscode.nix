{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.vscode;
in
{# Text editor on steroids
    options.pkgsConfig.vscode = {
        enable = mkEnableOption "vscode";
    };
    config = mkIf cfg.enable {
        programs.vscode = {#TODO: manage settings for vsc
            enable = true;
        };
    };
}
    