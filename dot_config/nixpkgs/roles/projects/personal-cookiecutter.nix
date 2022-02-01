{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.projects.personal-cookiecutter;
in
{
    options.projects.personal-cookiecutter = {
        enable = mkEnableOption "my personal cookiecutter";
    };
    config = mkIf cfg.enable {
        pkgsConfig = {
            cookiecutter.enable = true;
        };
        activation.gitCloner.repos = [ https://github.com/PartemImperium/personal-cookiecutter.git ];
    };
}
