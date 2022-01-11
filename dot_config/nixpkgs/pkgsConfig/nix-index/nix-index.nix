{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.nix-index;
in
{# index of files in installed through nix as well as a command not found/ suggestted install 
    options.pkgsConfig.nix-index = {
        enable = mkEnableOption "nix-index";

        package = mkOption {
            type = types.package;
            default = pkgs.nix-index;
        };
    };
    config = mkIf cfg.enable {
      programs.nix-index = {
        enable = true;
        package = cfg.package;
        enableZshIntegration = config.pkgsConfig.zsh.enable;
      };
    };
}
    