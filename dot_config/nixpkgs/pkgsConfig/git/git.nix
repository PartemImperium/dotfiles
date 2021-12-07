{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.git;
in
{
    options.pkgsConfig.git = {
        enable = mkOption {# Im using mkOption instead of mkEnableOption as you cant set the default of mkEnableOption and until I have all of the modules using options I will pull the defaults out and put them in a install by roles module.
                description = "Whether to enable git.";
                type = types.bool;
                default = true;
            };
    };
    config = mkIf cfg.enable {
        programs.git = {
            enable = true;

            userEmail = "88595311+PartemImperium@users.noreply.github.com";
            userName = "PartemImperium";

            extraConfig = {
                push = {
                    default = "current";
                };

                init = {
                    defaultBranch = "master";
                };
            };
        };
        home.packages = [ pkgs.git ]; #TODO: check if needed home-manager enabled should already be installing it
    };
}