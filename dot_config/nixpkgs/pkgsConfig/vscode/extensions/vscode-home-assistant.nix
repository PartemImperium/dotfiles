{ pkgs, lib, ... }:
{  
    programs.vscode = {
        extensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
            {
                name = "vscode-home-assistant";
                publisher = "keesschollaart";
                version = "1.22.0";
                sha256 = "0xfvnf549hyww71g8xyp473nhrv40mawpy3w9r2nh9cy93xldr02";
            }
        ];
    };
}
    