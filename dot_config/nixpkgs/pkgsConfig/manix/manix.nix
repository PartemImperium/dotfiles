{ pkgs, lib, config, ... }:
let 
    # This is just a direct assingment here but others may have more logic and keeping things standardized makes it easier to work with.
    isEnabled = true;
in
{# man tool for nix options (across nix, home-manager, ect)
    home.packages = lib.lists.optionals isEnabled [ pkgs.manix ];
}
    