{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.keycodes;
in
{# Key Codes is a little utility that displays the key code, unicode value, and modifier keys state for any key combination you press. If you're a developer, this might be useful to you.
    options.pkgsConfig.keycodes = {
        enable = mkEnableOption "keycodes";

        package = mkOption {
            type = types.package;
            default = pkgs.keycodes;
        };
    };
    config = mkIf cfg.enable {
        home.packages = [ cfg.package ];
    };
}
    