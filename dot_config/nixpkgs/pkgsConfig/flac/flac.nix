{ pkgs, lib, config, ... }:
let 
    # This is just a direct assingment here but others may have more logic and keeping things standardized makes it easier to work with.
    isEnabled = config.variables.roles.audio;
in
{# cli tool to encode audio files as flac
    home.packages = lib.lists.optionals isEnabled [ pkgs.flac ];
}
    