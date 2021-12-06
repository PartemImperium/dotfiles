{ pkgs, lib, config, ... }:
{  
    programs.vscode = {
        extensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
            {
                 name = "vscode-npm";
                 publisher = "fknop";
                 version = "3.3.0";
                 sha256 = "0v97whq3dpd5if01n0b7zxb7n23ljyq8ay4px8bvqqc2cpiy353w";
            }
        ];
    };
}
    