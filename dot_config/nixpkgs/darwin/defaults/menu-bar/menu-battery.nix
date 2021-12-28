{ pkgs, lib, config, ... }:
{
    targets.darwin.defaults."${config.home.homeDirectory}/Library/Preferences/ByHost/com.apple.controlcenter.plist" = {
        BatteryShowPercentage = true;
    };
}
