{ pkgs, ... }:
let 
    vars = import ../../variables.nix;
    isEnabled = true;# This is just a direct assingment here but others may have more logic and keeping things standardized makes it easier to work with.
in
{# helper to get sha hash of git repos used for using repos in a nix module
    home.packages = lib.lists.optionals isEnabled [ pkgs.nix-prefetch-git ];
}
    