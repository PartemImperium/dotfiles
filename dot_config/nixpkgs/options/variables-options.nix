{ lib, pkgs, config, ... }:
with lib; 
{
    options.variables = {
        roles = {
            audio = mkOption {
                description = "Should Audio apps be installed?";
                type = types.bool;
                default = false;
            };
            video = mkOption {
                description = "Should Video apps be installed?";
                type = types.bool;
                default = false;
            };
            image = mkOption {
                description = "Should Image apps be installed?";
                type = types.bool;
                default = false;
            };
            av-production = mkOption {
                description = "Should AV Production apps be installed?";
                type = types.bool;
                default = false;
            };
        };
        system = {
            isDarwin = mkOption {
                description = "Is this computer running macos?";
                type = types.bool;
                default = false;
            };
            isWsl = mkOption {
                description = "Is this computer running Windows Subsystems for Linux?";
                type = types.bool;
                default = false;
            };
            isLinux = mkOption {
                description = "Is this computer running Linux?";
                type = types.bool;
                default = false;
            };
            isGui = mkOption {
                description = "Does this computer have a GUI/Window Manager installed? This is used to decide if GUI apps should be installed.";
                type = types.bool;
                default = false;
            };
            isWork = mkOption {
                description = "Is this a computer? This is used to decide if modules in the work folder are loaded. They should not be kept in source control as they hold work specifc info.";
                type = types.bool;
                default = false;
            };
        };
        user = {
            name = mkOption {
                description = "Username of the current user. This will be used to set the home-mamager username";
                type = types.str;
            };
            homeDirectory = mkOption {
                description = "Home directory of the current user. This will be used to set the home-mamager username";
                type = types.str;
            };
        };
    };
}