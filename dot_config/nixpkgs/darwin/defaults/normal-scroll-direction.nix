{ pkgs, lib, config, ... }:
{
    targets.darwin.defaults = {
        NSGlobalDomain = {
            "com.apple.swipescrolldirection" = false;
        };
    };
}
