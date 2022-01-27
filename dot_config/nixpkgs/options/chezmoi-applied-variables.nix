{ config, ... }:
let
vars = import ../variables.nix;
in
{
    config.variables = {
        system = {
            isDarwin = vars.isDarwin;
            isWsl = vars.isWsl;
            isLinux = vars.isLinux;
            isGui = vars.isGui;
            isWork = vars.isWsl;
        };
    };
}
