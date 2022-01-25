{ config, lib, pkgs, ... }:
with lib;
let 
    cfg = config.activation.gitCloner;
in
{
    options.activation.gitCloner = {
        repos = mkOption {
            type = types.listOf types.str;
            default = [];
        };
        baseRepoDir = mkOption {
            type = types.str;
        };
    };
    config = mkIf ((length cfg.repos) > 0) {
        home.activation.gitCloner = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        baseRepoDir=${cfg.baseRepoDir}

        # If the repo dir does not exist then make it.
        if [ ! -d "$baseRepoDir" ]; then
            $DRY_RUN_CMD mkdir -p $baseRepoDir
        fi

        for cloneRepo in ${pkgs.myLib.scripting.convertListToBashArray cfg.repos}; do
            # Find the "humanish" name of the repo like git would do so we can check if the folder exists already
            #https://stackoverflow.com/a/13840032/10394756

            # Strip off everything from the beginning up to and including the last slash
            humanish=''${cloneRepo##*/}
            # Strip off the .git part from the end of the humanish
            humanish=''${humanish%%.git}

            if [ ! -d "$baseRepoDir/$humanish" ]; then
                ${pkgs.git}/bin/git -C $baseRepoDir clone $cloneRepo $humanish --recurse-submodules
            fi
        done
        '';
    };
}