{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.manix;
in
{# man tool for nix options (across nix, home-manager, ect)
    options.pkgsConfig.manix = {
        enable = mkEnableOption "manix";

        package = mkOption {
            type = types.package;
            default = pkgs.manix;
        };
    };
    config = mkIf cfg.enable {
        home.packages = [ cfg.package ];
    };
}
    