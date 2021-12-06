{ pkgs, lib, config, ... }:
{  
    programs.vscode = {
        extensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
            {
                name = "todo-tree";
                publisher = "Gruntfuggly";
                version = "0.0.214";
                sha256 = "0rwxjnrl44rnhx3183037k6435xs4772p58a37azl5cahsyav1hk";
            }
        ];
    };
}
    