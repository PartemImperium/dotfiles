{ pkgs, lib, config, ... }:
{
    targets.darwin.defaults = {
        "com.apple.Finder" = {
            FXEnableExtensionChangeWarning = false;
        };
    };
}
