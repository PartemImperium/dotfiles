{ pkgs, lib, ... }:
let 
    vars = import ../../variables.nix;
    isEnabled = true;# This is just a direct assingment here but others may have more logic and keeping things standardized makes it easier to work with.
in
{# cli text editor
    home.packages = lib.lists.optionals isEnabled [ pkgs.nano ];
}
