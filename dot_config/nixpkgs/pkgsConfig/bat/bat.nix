{ pkgs, lib, ... }:
let 
    vars = import ../../variables.nix;
    isEnabled = true;# This is just a direct assingment here but others may have more logic and keeping things standardized makes it easier to work with.
in
{# cat clone on steroids
    home.packages = lib.lists.optionals isEnabled [ pkgs.bat ];
}#TODO: Start figure out what config bat has and set it up here
    