{ pkgs, ... }:
{# helper to get sha hash of git repos used for using repos in a nix module
    home.packages = [ pkgs.nix-prefetch-git ];
}
    