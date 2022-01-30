{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.package-modules.npm;
in
{
    options.package-modules.npm = {
        enable = mkEnableOption "npm";

        package = mkOption {
            type = types.package;
            default = pkgs.nodePackages.npm;
        };

        settings = mkOption {
            type = types.attrs;
            default = {};
        };
    };
    config = mkIf cfg.enable {
        home.packages = [ cfg.package ];

        home.file.".npmrc" = mkIf (cfg.settings != { }) {
            # generators.toINI doesnt support section-less ini. Use this instead. Fix once this issue is resolved https://github.com/NixOS/nixpkgs/issues/107491
            text = pkgs.lib.generators.toKeyValue {} cfg.settings;
      };
    };
}
