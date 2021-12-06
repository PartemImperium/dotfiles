{ pkgs, lib, config, ... }:
let 
    #TODO: remove this hard false and figure out why it isnt building for me
    isEnabled = false 
             && config.variables.roles.audio 
             && config.variables.system.isGui;
in
{# audio tagging program
    home.packages = lib.lists.optionals isEnabled [ pkgs.picard ];
}
    