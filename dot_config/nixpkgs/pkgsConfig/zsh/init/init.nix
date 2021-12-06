{ pkgs, lib, config, ... }:
let
    fileHelpers = import ../../../fileHelpers.nix { lib = lib; };
in
{
    programs.zsh = {
        # Load in all the zsh files in the initExtra, initExtraBeforeCompInit, and initExtraFirst directories into the config. 
        # This allows for adding stuff to the .zshrc file (in the specified spots) from normal zsh files (where a editor will have zsh syntax highlighting).
        # This also allows breaking the content being added up into several smaller files.
        initExtra = fileHelpers.combileFiles (fileHelpers.validZshFiles ./initExtra);
        initExtraBeforeCompInit = fileHelpers.combileFiles (fileHelpers.validZshFiles ./initExtraBeforeCompInit);
        initExtraFirst = fileHelpers.combileFiles (fileHelpers.validZshFiles ./initExtraFirst);
    };
}
