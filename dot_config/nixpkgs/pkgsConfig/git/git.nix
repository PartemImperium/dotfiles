{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.git;
in
{
    options.pkgsConfig.git = {
        enable = mkEnableOption "git";
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