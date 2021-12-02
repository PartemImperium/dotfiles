{ pkgs, ... }:
{
    programs.git = {
        enable = true;

        userEmail = "88595311+PartemImperium@users.noreply.github.com";
        userName = "PartemImperium";

        extraConfig = {
            push = {
                default = "current";
            };

            init = {
                defaultBranch = "master";
            };
        };
    };
        home.packages = [ pkgs.git ];
}