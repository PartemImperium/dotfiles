{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.gimp;

    #https://discourse.nixos.org/t/how-does-one-pin-nixos-to-a-specific-version-of-nixpkgs-edited-to-add-dont-or-else-youll-miss-out-on-security-updates/5727
    #The current version of the gimp packge does not build correctly but this has been fixed in vvvv this commit. Until this is in a upstream release pin this commit 
    #TODO: remove the pin when it is no longer needed
    pinnedPkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/39bc2f7abe5c4eb71c6f47d974606467539e0354.tar.gz") {};
in
{# free (raster) image editing utility much like photoshop
    options.pkgsConfig.gimp = {
        enable = mkEnableOption "gimp";

        package = mkOption {
            type = types.package;
            default = pinnedPkgs.gimp;
        };
    };
    config = mkIf (cfg.enable && false) {#TODO: remove this hard false and figure out why it isnt building for me
        home.packages = [ cfg.package ];
    };
}
