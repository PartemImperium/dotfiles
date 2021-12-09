{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.nix-index;
in
{# index of files in installed through nix as well as a command not found/ suggestted install 
    options.pkgsConfig.nix-index = {
        enable = mkEnableOption "nix-index";
    };
    config = mkIf cfg.enable {
      programs.nix-index = {
        enable = true;
        enableZshIntegration = true;
      };
    };
}
    