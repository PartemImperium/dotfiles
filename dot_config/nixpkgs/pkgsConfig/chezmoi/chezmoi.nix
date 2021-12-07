{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.chezmoi;
in
{# dotfiles manager - This is largly not used anymore to manage dotfiles but more so to keep track of machine info. This will likly be removed once I find a way I want to do machine info in nix
    options.pkgsConfig.chezmoi = {
        enable = mkOption {# Im using mkOption instead of mkEnableOption as you cant set the default of mkEnableOption and until I have all of the modules using options I will pull the defaults out and put them in a install by roles module.
                description = "Whether to enable chezmoi.";
                type = types.bool;
                default = true;
            };
    };
    config = mkIf cfg.enable {
        home.packages = [ pkgs.chezmoi ];
    };
}
