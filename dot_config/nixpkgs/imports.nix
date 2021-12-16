{ config, lib, pkgs, options, ... }:
with lib.lists;
let
    vars = import ./variables.nix;
    #This one cant use myLib from my overlay as it causes infinite recursion......
    fileHelpers = import ./fileHelpers.nix { lib = lib; };
in
{
    imports = 
        fileHelpers.validNixFiles ./options
     ++ fileHelpers.validNixFiles ./roles   
     ++ optionals vars.isDarwin (fileHelpers.validNixFiles ./darwin)
     ++ optionals vars.isLinux (fileHelpers.validNixFiles ./linux)
     ++ optionals vars.isWsl (fileHelpers.validNixFiles ./wsl)
     ++ fileHelpers.validNixFiles ./pkgsConfig
     # The work modules are not tracked in git. They are added manually on my work computer for anything that is work specific (and I dont want in source control). 
     # They are also added after everything else so that they can override settings set in other configs.
     ++ optionals vars.isWork (fileHelpers.validNixFiles ./work); 
}