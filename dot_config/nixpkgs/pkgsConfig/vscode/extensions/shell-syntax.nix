{ pkgs, lib, ... }:
{  
    programs.vscode = {
        extensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
            {
                 name = "shell-syntax";
                 publisher = "bmalehorn";
                 version = "1.0.3";
                 sha256 = "1c8pv3h1inm6rlqfaiqnri6h55dywrmvwnin7gs85s4l8bc4v0vr";
            }
        ];
    };
}
    