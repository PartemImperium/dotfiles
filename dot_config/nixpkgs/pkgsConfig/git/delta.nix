{ pkgs, lib, config, ... }:
{
    programs.git.delta = {
        enable = true;

        options = {
            side-by-side = true;
            syntax-theme = "Dracula";
            hyperlinks = false; # Alacritty does not support the hyperlink format yet (https://github.com/alacritty/alacritty/pull/5480) when it does turn this on.
        };
    };
}