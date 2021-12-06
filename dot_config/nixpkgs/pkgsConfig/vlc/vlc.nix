{ pkgs, lib, ... }:
let 
    vars = import ../../variables.nix;
    #TODO: remove this hard false and figure out why it isnt building for me
    isEnabled = false && vars.shouldInstallApps && vars.isGui;# This is just a direct assingment here but others may have more logic and keeping things standardized makes it easier to work with.
in
{# audio and video player 
    home.packages = lib.lists.optionals isEnabled [ pkgs.vlc ];
}
    