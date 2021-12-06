{ pkgs, lib, config, ... }:
let 
    # This is just a direct assingment here but others may have more logic and keeping things standardized makes it easier to work with.
    isEnabled = true;
in
{# cli markdown renderer
    home.packages = lib.lists.optionals isEnabled [ pkgs.glow ];
}
    