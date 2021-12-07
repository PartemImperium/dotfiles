{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.nix-prefetch-git;
in
{# helper to get sha hash of git repos used for using repos in a nix module
    options.pkgsConfig. nix-prefetch-git = {
        enable = mkEnableOption "nix-prefetch-git";
    };
    config = mkIf cfg.enable {
        home.packages = [ pkgs.nix-prefetch-git ];
    };
}
    