{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.netcat;
in
{# cli tool for arbitrary TCP and UDP connections and listens
    options.pkgsConfig.netcat = {
        enable = mkEnableOption "netcat";

        package = mkOption {
            type = types.package;
            default = pkgs.netcat;
        };
    };
    config = mkIf cfg.enable {
        home.packages = [ cfg.package ];
    };
}
    