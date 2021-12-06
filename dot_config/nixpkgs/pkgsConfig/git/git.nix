{ pkgs, lib, config, ... }:
let 
    # This is just a direct assingment here but others may have more logic and keeping things standardized makes it easier to work with.
    isEnabled = true;
in
{
    programs.git = {
        enable = isEnabled;

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
    home.packages = lib.lists.optionals isEnabled [ pkgs.git ];
}