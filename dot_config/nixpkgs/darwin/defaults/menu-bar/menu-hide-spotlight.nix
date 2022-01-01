{ pkgs, lib, config, ... }:
{
    targets.darwin.defaults."com.apple.Spotlight" = {
        MenuItemHidden = true;
    };
}
