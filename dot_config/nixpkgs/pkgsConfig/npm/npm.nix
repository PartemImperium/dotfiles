{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.npm;
in
{# js package manager
    options.pkgsConfig.npm = {
        enable = mkEnableOption "npm";

        package = mkOption {
            type = types.package;
            default = pkgs.nodePackages.npm;
        };
    };
    config.package-modules.npm = mkIf cfg.enable {
        enable = true;
        package = cfg.package;
        settings = {
            update-notifier = false;
            shell = "${pkgs.zsh}/bin/zsh";
        };
    };
}
