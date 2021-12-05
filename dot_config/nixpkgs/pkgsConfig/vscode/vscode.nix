{ pkgs, lib, ... }:
let 
    vars = import ../../variables.nix;
    isEnabled = vars.isGui;# This is just a direct assingment here but others may have more logic and keeping things standardized makes it easier to work with.
in
{# Text editor on steroids
    
        programs.vscode = {
            enable = isEnabled;

            extensions = with pkgs.vscode-extensions; [
                eamodio.gitlens
                jnoortheen.nix-ide
            ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
                   {
                        name = "todo-tree";
                        publisher = "Gruntfuggly";
                        version = "0.0.214";
                        sha256 = "0rwxjnrl44rnhx3183037k6435xs4772p58a37azl5cahsyav1hk";
                   }
                   {
                        name = "font-preview";
                        publisher = "ctcuff";
                        version = "1.2.2";
                        sha256 = "0l37llc2bfr47205nrb0jyb9bz61xxvblmzzp0qg87gc5v7npx0r";
                   }
                   {
                       name = "vscode-home-assistant";
                       publisher = "keesschollaart";
                       version = "1.22.0";
                       sha256 = "0xfvnf549hyww71g8xyp473nhrv40mawpy3w9r2nh9cy93xldr02";
                   }
                   {
                        name = "shell-syntax";
                        publisher = "bmalehorn";
                        version = "1.0.3";
                        sha256 = "1c8pv3h1inm6rlqfaiqnri6h55dywrmvwnin7gs85s4l8bc4v0vr";
                   }
                   {
                        name = "zsh-debug";
                        publisher = "rogalmic";
                        version = "0.1.3";
                        sha256 = "0f7l6iqbhr5drv83wavmb2hbq73qcksif14bpygqn6d8cslhmm4x";
                   }  
                   {
                        name = "vscode-npm";
                        publisher = "fknop";
                        version = "3.3.0";
                        sha256 = "0v97whq3dpd5if01n0b7zxb7n23ljyq8ay4px8bvqqc2cpiy353w";
                   }
            ];
        };
    
    home.packages = lib.lists.optionals isEnabled [ pkgs.vscode ];
}
    