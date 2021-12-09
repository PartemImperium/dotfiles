{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.bat;
in
{# cat clone on steroids
    options.pkgsConfig.bat = {
        enable = mkEnableOption "bat";
    };
    config = mkIf cfg.enable {
        programs.bat = {
            enable = true;
            config = {
                paging = "never";
            };
        };
    };
}
    