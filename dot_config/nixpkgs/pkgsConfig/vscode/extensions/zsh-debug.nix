{ pkgs, lib, ... }:
{  
    programs.vscode = {
        extensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
            {
                 name = "zsh-debug";
                 publisher = "rogalmic";
                 version = "0.1.3";
                 sha256 = "0f7l6iqbhr5drv83wavmb2hbq73qcksif14bpygqn6d8cslhmm4x";
            }
        ];
    };
}
    