{ pkgs, lib, config, ... }:
let 
    #TODO: remove this hard false and figure out why it isnt building for me
    # This is just a direct assingment here but others may have more logic and keeping things standardized makes it easier to work with.
    isEnabled = true;
in
{# index of files in installed through nix as well as a command not found/ suggestted install 
    programs.nix-index = {
      enable = isEnabled;
      enableZshIntegration = true;
    };
    home.packages = lib.lists.optionals isEnabled [ pkgs.nix-index ];
}
    