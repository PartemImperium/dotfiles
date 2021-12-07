{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.neofetch;
in
{# cli tool for displaying system info 
    options.pkgsConfig.neofetch = {
        enable = mkEnableOption "neofetch";
    };
    config = mkIf cfg.enable {
        home.packages = [ pkgs.neofetch ];
        programs.zsh.initExtra = "${pkgs.neofetch}/bin/neofetch";
    };
}
