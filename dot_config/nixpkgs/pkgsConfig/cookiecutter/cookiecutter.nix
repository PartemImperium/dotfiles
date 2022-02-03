{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.cookiecutter;
in
{# cli tool for creating cookecutter git repos 
    options.pkgsConfig.cookiecutter = {#TODO: Make package-module for settings
        enable = mkEnableOption "cookiecutter";

        package = mkOption {
            type = types.package;
            default = pkgs.cookiecutter;
        };
    };
    config = mkIf cfg.enable {
        home.packages = [ cfg.package ];
    };
}
