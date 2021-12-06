{ pkgs, lib, config, ... }:
let 
    # This is just a direct assingment here but others may have more logic and keeping things standardized makes it easier to work with.
    isEnabled = config.variables.roles.video;
in
{# video encoder
    home.packages = lib.lists.optionals isEnabled [ pkgs.ffmpeg ];
}
    