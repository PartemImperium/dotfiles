{ pkgs, ... }:
let 
    vars = import ../../variables.nix;
    isEnabled = true;# This is just a direct assingment here but others may have more logic and keeping things standardized makes it easier to work with.
in
{# man tool for nix options (across nix, home-manager, ect)
    home.packages = lib.lists.optionals isEnabled [ pkgs.manix ];
}
    