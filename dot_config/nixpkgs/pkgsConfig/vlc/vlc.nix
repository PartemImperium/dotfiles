{ pkgs, lib, config, ... }:
let 
    #TODO: remove this hard false and figure out why it isnt building for me
    isEnabled = false 
             && true #TODO: Figure out what role to put this in... I want it on almost everything but work computer doesnt need VLC 
             && config.variables.system.isGui;
in
{# audio and video player 
    home.packages = lib.lists.optionals isEnabled [ pkgs.vlc ];
}
    