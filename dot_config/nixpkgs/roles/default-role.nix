{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.variables.roles;
    isGui = config.variables.system.isGui;
in
{
    config.pkgsConfig = {
        alacritty.enable = true;#TODO: Do isGui
        bat.enable = true;
        chezmoi.enable = true;
        curl.enable = true;
        git.enable = true;
        glow.enable = true;
        manix.enable = true;
        nano.enable = true;
        neofetch.enable = true;
        nix-index.enable = true;
        nix-prefetch-git.enable = true;
        vscode.enable = true;#TODO: Do isGui
        zsh.enable = true;
    };
}
    