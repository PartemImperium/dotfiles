{ pkgs, lib, config, ... }:
let 
    #TODO: remove this hard false and figure out why it isnt building for me
    isEnabled = false 
             && config.variables.roles.image
             && config.variables.system.isGui;
             
in
{# free vector graphics editor
    home.packages = lib.lists.optionals isEnabled [ pkgs.inkscape ];
}
    