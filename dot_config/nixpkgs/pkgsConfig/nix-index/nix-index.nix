{ pkgs, ... }:
{# index of files in installed through nix as well as a command not found/ suggestted install 
    programs.nix-index = {
      enable = true;
      enableZshIntegration = true;
    };
    home.packages = [ pkgs.nix-index ];
}
    