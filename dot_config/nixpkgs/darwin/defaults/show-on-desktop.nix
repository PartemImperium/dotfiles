{ pkgs, lib, config, ... }:
{
    targets.darwin.defaults."com.apple.Finder" = {
        ShowExternalHardDrivesOnDesktop = true;
        ShowHardDrivesOnDesktop = true;
        ShowMountedServersOnDesktop = true;
        ShowRemovableMediaOnDesktop = true;
    };
}
