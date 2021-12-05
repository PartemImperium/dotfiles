{ pkgs, lib, ... }:
{  
    programs.vscode = {
        extensions = with pkgs.vscode-extensions; [
            eamodio.gitlens
        ];
    };
}
    