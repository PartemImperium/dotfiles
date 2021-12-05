{ pkgs, lib, ... }:
{  
    programs.vscode = {
        extensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
            {
                 name = "font-preview";
                 publisher = "ctcuff";
                 version = "1.2.2";
                 sha256 = "0l37llc2bfr47205nrb0jyb9bz61xxvblmzzp0qg87gc5v7npx0r";
            }
        ];
    };
}
    