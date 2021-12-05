{ pkgs, lib, ... }:
let 
    vars = import ../../variables.nix;
    isEnabled = vars.shouldInstallVideo;# This is just a direct assingment here but others may have more logic and keeping things standardized makes it easier to work with.
in
{# cli tool to download videos from youtube and other online sites
    home.packages = lib.lists.optionals isEnabled [ pkgs.youtube-dl ];
}
