{ pkgs, lib, config, ... }:
{
    #com.apple.dock persistent-apps look into this one
    targets.darwin.defaults."com.apple.dock" = {
        autohide = true;
        launchanim = true;
    };
}
