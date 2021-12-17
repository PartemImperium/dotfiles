{ lib, pkgs, config, ... }:
with lib; 
{
    options.pkgsConfig.shared.terminal = {

        lineBufferSize = mkOption {
            type = types.int;
            default = 100000;
        };

        font = mkOption {
            type = types.str;
            default = "Hack Nerd Font Mono";
        };
    };
}