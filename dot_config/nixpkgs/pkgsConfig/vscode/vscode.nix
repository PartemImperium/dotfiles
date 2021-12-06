{ pkgs, lib, config, ... }:
let 
    # This is just a direct assingment here but others may have more logic and keeping things standardized makes it easier to work with.
    isEnabled = config.variables.system.isGui;
in
{# Text editor on steroids
   
    programs.vscode = {#TODO: manage settings for vsc
        enable = isEnabled;
    };
   
    home.packages = lib.lists.optionals isEnabled [ pkgs.vscode ];
}
    