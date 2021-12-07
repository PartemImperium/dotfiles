{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.vscode;
in
{# Text editor on steroids
    options.pkgsConfig.vscode = {
        enable = mkOption {# Im using mkOption instead of mkEnableOption as you cant set the default of mkEnableOption and until I have all of the modules using options I will pull the defaults out and put them in a install by roles module.
            description = "Whether to enable vscode.";
            type = types.bool;
            default = config.variables.system.isGui;
        };
    };
    config = mkIf cfg.enable {
        home.packages = [ pkgs.vscode ]; #TODO: I dont think this is needed
        programs.vscode = {#TODO: manage settings for vsc
            enable = true;
        };
    };
}
    