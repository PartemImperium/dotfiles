{ pkgs, lib, ... }:
let 
    vars = import ../../variables.nix;
    isEnabled = vars.isGui;# This is just a direct assingment here but others may have more logic and keeping things standardized makes it easier to work with.
in
{# Text editor on steroids
    
        programs.vscode = {
            enable = isEnabled;

            extensions = with pkgs.vscode-extensions; [
                eamodio.gitlens
                jnoortheen.nix-ide
            ];
        };
    
    home.packages = lib.lists.optionals isEnabled [ pkgs.vscode ];
}
    