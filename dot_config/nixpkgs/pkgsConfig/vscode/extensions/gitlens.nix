{ pkgs, lib, config, ... }:
{  
    programs.vscode = {
        extensions = with pkgs.vscode-extensions; [
            eamodio.gitlens
        ];
    };
}
    