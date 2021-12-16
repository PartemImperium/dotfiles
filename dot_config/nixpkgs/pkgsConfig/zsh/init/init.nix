{ pkgs, lib, config, ... }:
{
    programs.zsh = {
        # Load in all the zsh files in the initExtra, initExtraBeforeCompInit, and initExtraFirst directories into the config. 
        # This allows for adding stuff to the .zshrc file (in the specified spots) from normal zsh files (where a editor will have zsh syntax highlighting).
        # This also allows breaking the content being added up into several smaller files.
        initExtra = pkgs.myLib.file.combineFiles (pkgs.myLib.file.validZshFiles ./initExtra);
        initExtraBeforeCompInit = pkgs.myLib.file.combineFiles (pkgs.myLib.file.validZshFiles ./initExtraBeforeCompInit);
        initExtraFirst = pkgs.myLib.file.combineFiles (pkgs.myLib.file.validZshFiles ./initExtraFirst);
    };
}
