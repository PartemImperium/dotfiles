{ pkgs, lib, config, ... }:
{
    targets.darwin.defaults = {
        "com.apple.Finder" = {
            AppleShowAllFiles = true;
            _FXShowPosixPathInTitle = true;

            ShowStatusBar = true;
            ShowPathbar = true;
        };
        NSGlobalDomain = {
            AppleShowAllExtensions = true;
        };
    };
}
