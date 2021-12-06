{ pkgs, lib, ... }:
{
    programs.git = {
        aliases = {
            # Fix Typos
            pish = "push";
        };
    };
}