{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.bat;
in
{# cat clone on steroids
    options.pkgsConfig.bat = {
        enable = mkEnableOption "bat";

        package = mkOption {#This isnt actually used to install anything as the bat home manager module doesnt have a package. But It is used for making sure the app works on the installed machine and is not broken
            type = types.package;
            default = pkgs.bat;
        };
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
    