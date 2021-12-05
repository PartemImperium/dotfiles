{ pkgs, lib, ... }:
let 
    vars = import ../../variables.nix;
    isEnabled = vars.isGui;# This is just a direct assingment here but others may have more logic and keeping things standardized makes it easier to work with.
in
{# Text editor on steroids
   
    programs.vscode = {#TODO: manage settings for vsc
        enable = isEnabled;
    };
   
    home.packages = lib.lists.optionals isEnabled [ pkgs.vscode ];
}
    