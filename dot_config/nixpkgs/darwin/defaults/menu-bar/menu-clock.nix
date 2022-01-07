{ pkgs, lib, config, ... }:
{
    targets.darwin.defaults."com.apple.menuextra.clock" = {
        FlashDateSeparators = true;
    };
}
