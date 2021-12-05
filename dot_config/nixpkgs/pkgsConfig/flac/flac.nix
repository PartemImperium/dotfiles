{ pkgs, lib, ... }:
let 
    vars = import ../../variables.nix;
    isEnabled = vars.shouldInstallAudio;# This is just a direct assingment here but others may have more logic and keeping things standardized makes it easier to work with.
in
{# cli tool to encode audio files as flac
    home.packages = lib.lists.optionals isEnabled [ pkgs.flac ];
}
    