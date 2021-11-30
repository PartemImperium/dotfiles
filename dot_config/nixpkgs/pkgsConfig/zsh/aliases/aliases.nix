{ ... }:
{
    programs.zsh = {
        shellAliases = {
            # Allow sudo to use aliases http://www.shellperson.net/using-sudo-with-an-alias/
            sudo = "sudo ";
            please = "sudo ";

            # Navigation Helpers (relitive-directory-aliases.nix does x number of ../../ to ... aliases)
            "~~" = "cd ~";
            ".." = "cd ..";

            # Fix Typo's
            gity = "git";
            rebooty = "reboot"; # This is happens to be a funny new way to reboot too
        };
    };
}