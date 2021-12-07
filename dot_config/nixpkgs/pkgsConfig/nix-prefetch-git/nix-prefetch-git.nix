{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.nix-prefetch-git;
in
{# helper to get sha hash of git repos used for using repos in a nix module
    options.pkgsConfig. nix-prefetch-git = {
        enable = mkOption {# Im using mkOption instead of mkEnableOption as you cant set the default of mkEnableOption and until I have all of the modules using options I will pull the defaults out and put them in a install by roles module.
            description = "Whether to enable nix-prefetch-git.";
            type = types.bool;
            default = true;
        };
    };
    config = mkIf cfg.enable {
        home.packages = [ pkgs.nix-prefetch-git ];
    };
}
    