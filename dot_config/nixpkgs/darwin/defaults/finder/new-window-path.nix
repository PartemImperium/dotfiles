{ pkgs, lib, config, ... }:
{
    targets.darwin.defaults."com.apple.Finder" = {
        NewWindowTarget = "PfLo";
        NewWindowTargetPath = "file://${config.home.homeDirectory}/";
    };
}
