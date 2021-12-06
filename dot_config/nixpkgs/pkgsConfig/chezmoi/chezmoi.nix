{ pkgs, lib, config, ... }:
let 
    # This is just a direct assingment here but others may have more logic and keeping things standardized makes it easier to work with.
    isEnabled = true;
in
{# dotfiles manager - This is largly not used anymore to manage dotfiles but more so to keep track of machine info. This will likly be removed once I find a way I want to do machine info in nix
    home.packages = lib.lists.optionals isEnabled [ pkgs.chezmoi ];
}
