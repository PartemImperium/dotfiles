{ pkgs, lib, config, ... }:
let 
    # This is just a direct assingment here but others may have more logic and keeping things standardized makes it easier to work with.
    isEnabled = config.variables.roles.video;
in
{# cli tool to download videos from youtube and other online sites
    home.packages = lib.lists.optionals isEnabled [ pkgs.youtube-dl ];
}
