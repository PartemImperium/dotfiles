{ pkgs, lib, config, ... }:
let 
    #TODO: remove this hard false and figure out why it isnt building for me
    # This is just a direct assingment here but others may have more logic and keeping things standardized makes it easier to work with.
    isEnabled = false && config.variables.roles.video;
in
{# bluray ripping tool 
    home.packages = lib.lists.optionals isEnabled [ pkgs.makemkv ];
    #TODO: Get config all set up for this one    
}
    