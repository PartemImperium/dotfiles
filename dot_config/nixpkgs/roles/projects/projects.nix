{ pkgs, lib, config, ... }:
with lib;
{
    activation.gitCloner.baseRepoDir = "${builtins.getEnv "HOME"}/repos";
}
