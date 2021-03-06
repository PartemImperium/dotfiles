{ config, lib, pkgs, ... }:
{
    home.activation.copyApplications =
    let
    apps = pkgs.buildEnv {
        name = "home-manager-applications";
        paths = config.home.packages;
        pathsToLink = "/Applications";
    };
    in #TODO: Figure out a way to automattically create the icon as if it changes (through OS update or user changing the default) it has to be done manually currently.
    lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    baseDir="$HOME/Applications/Home Manager"
    if [ -d "$baseDir" ]; then
        $DRY_RUN_CMD rm -rf "$baseDir"
    fi
    mkdir -p "$baseDir"
    Rez -append ${./.}/home-manager-applications-icon.rsrc -o "$baseDir"$'/Icon\r'
    SetFile -a C "$baseDir"
    SetFile -a V "$baseDir"$'/Icon\r'
    for appFile in ${apps}/Applications/*; do
        target="$baseDir/$(basename "$appFile")"
        $DRY_RUN_CMD cp ''${VERBOSE_ARG:+-v} -fHRL "$appFile" "$baseDir"
        $DRY_RUN_CMD chmod ''${VERBOSE_ARG:+-v} -R +w "$target"
    done
    '';
}