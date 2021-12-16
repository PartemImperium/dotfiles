{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.neofetch;
in
{# cli tool for displaying system info 
    options.pkgsConfig.neofetch = {
        enable = mkEnableOption "neofetch";

        package = mkOption {
            type = types.package;
            default = pkgs.neofetch;
        };
    };
    config = mkIf cfg.enable {
        home.packages = [ cfg.package ];
        programs.zsh.initExtra = "${cfg.package}/bin/neofetch";
    };
}
