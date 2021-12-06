{ pkgs, lib, config, ... }:
let 
    # This is just a direct assingment here but others may have more logic and keeping things standardized makes it easier to work with.
    isEnabled = true;
in
{# cli tool to download files
    home.packages = lib.lists.optionals isEnabled [ pkgs.curl ];
}
