{ config, lib, pkgs, ... }:
with lib;
let 
    cfg = config.pkgsConfig.zsh;
in
{
    options.pkgsConfig.zsh = {
        enable = mkOption {# Im using mkOption instead of mkEnableOption as you cant set the default of mkEnableOption and until I have all of the modules using options I will pull the defaults out and put them in a install by roles module.
            description = "Whether to enable zsh.";
            type = types.bool;
            default = true;
        };
    };
    config = mkIf cfg.enable {
        home.packages = [ pkgs.zsh ];#TODO: I dont think this is needed
        programs.zsh = {
            enable = true;

            # Move zsh dotfiles into a seperate directory as they are managed by nix and they just clutter up the home dirictory
            dotDir = ".config/zsh";

            # cd into a directory by just typing it into shell
            autocd = true;

            history = {
                save = 10000;
                size = config.programs.zsh.history.save;

                # Dont add dupes and if they somehow exist remove them first
                expireDuplicatesFirst = true;
                ignoreDups = true;

                # Add items to history even if they start with a space.
                ignoreSpace = false;

                # Dont share history over sessions
                share = false;

                # Save timestamp in history
                extended = true;

                # Put the ZSH history into the same directory as the configuration.
                # (Keep it .zsh_history because $ZDOTDIR is just treated like an alternate
                # $HOME, not like xdg-style .config/... directories, so ZSH likes things
                # there to still have leading dots.)
                path = let
                            inherit (config.home) homeDirectory;
                            inherit (config.programs.zsh) dotDir;
                    in "${homeDirectory}/${dotDir}/.zsh_history";
            };
            #TODO: look into adding compiling to the plugins 
        };
    };
}