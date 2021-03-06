{ pkgs, lib, config, ... }:
{
    programs.zsh = {
        plugins = map (function:
        let 
            fileName = builtins.baseNameOf function;
            dir = builtins.dirOf function;
            functionName = builtins.replaceStrings [".zsh"] [""] fileName;
        in
        {
            name = ("function-" + functionName);
            file = fileName;
            src = dir;
        })
        (pkgs.myLib.file.validZshFiles ./.);
    };
}
