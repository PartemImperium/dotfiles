{ pkgs, lib, ... }:
let
    fileHelpers = import ../../../fileHelpers.nix { lib = lib; };
in
{
    programs.zsh = {
        plugins = map (function:#TODO: make this actually work without hard coding...
        {
            name = "function-folderize";
            file = "folderize.zsh";
            src = ./folderize;
        })
        (fileHelpers.validZshFiles ./.);
    };
}
