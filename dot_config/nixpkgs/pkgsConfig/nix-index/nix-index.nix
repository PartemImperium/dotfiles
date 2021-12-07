{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.nix-index;
in
{# index of files in installed through nix as well as a command not found/ suggestted install 
    options.pkgsConfig.nix-index = {
        enable = mkOption {# Im using mkOption instead of mkEnableOption as you cant set the default of mkEnableOption and until I have all of the modules using options I will pull the defaults out and put them in a install by roles module.
            description = "Whether to enable nix-index.";
            type = types.bool;
            default = true;
        };
    };
    config = mkIf cfg.enable {
      programs.nix-index = {
        enable = true;
        enableZshIntegration = true;
      };
      home.packages = [ pkgs.nix-index ];#TODO: I dont think this is needed.
    };
}
    