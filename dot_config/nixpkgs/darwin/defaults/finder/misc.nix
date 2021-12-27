{ pkgs, lib, config, ... }:
{
    targets.darwin.defaults."com.apple.Finder" = {
        ProhibitGoToFolder = false;

        _FXSortFoldersFirst = true;
    };
}
