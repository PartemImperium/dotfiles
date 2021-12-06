{ pkgs, lib, config, ... }:
let 
    # This is just a direct assingment here but others may have more logic and keeping things standardized makes it easier to work with.
    isEnabled = true;
in
{# cli tool for displaying system info 
    home.packages = lib.lists.optionals isEnabled [ pkgs.neofetch ];
    programs.zsh.initExtra = lib.strings.optionalString isEnabled "${pkgs.neofetch}/bin/neofetch";
}
