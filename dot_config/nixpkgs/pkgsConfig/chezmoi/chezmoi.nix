{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.chezmoi;
in
{# dotfiles manager - This is largly not used anymore to manage dotfiles but more so to keep track of machine info. This will likly be removed once I find a way I want to do machine info in nix
    options.pkgsConfig.chezmoi = {
        enable = mkEnableOption "chezmoi";

        package = mkOption {
            type = types.package;
            default = pkgs.chezmoi;
        };
    };
    config = mkIf cfg.enable {
        home.packages = [ cfg.package ];
    };
}
