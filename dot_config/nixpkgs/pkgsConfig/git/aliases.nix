{ pkgs, lib, config, ... }:
{
    programs.git = {
        aliases = {
            # Fix Typos
            pish = "push";
        };
    };
}