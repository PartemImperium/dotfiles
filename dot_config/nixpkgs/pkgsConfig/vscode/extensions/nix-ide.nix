{ pkgs, lib, ... }:
{  
    programs.vscode = {
        extensions = with pkgs.vscode-extensions; [
            jnoortheen.nix-ide
        ];
    };
}
    