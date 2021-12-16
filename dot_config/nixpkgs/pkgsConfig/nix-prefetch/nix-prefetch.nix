{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.nix-prefetch;
in
{# helper to get sha hash src's from the various fetchers for a nix module
    options.pkgsConfig. nix-prefetch = {
        enable = mkEnableOption "nix-prefetch";

        package = mkOption {
            type = types.package;
            default = pkgs.nix-prefetch;
        };
    };
    config = mkIf cfg.enable {
        home.packages = [ cfg.package ];
    };
}
    