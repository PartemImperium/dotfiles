{ config, lib, pkgs, ... }:
{
    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;

    imports = [ ./imports.nix ];

    # Home Manager needs a bit of information about you and the
    # paths it should manage.
    home.username = config.variables.user.name;
    home.homeDirectory = config.variables.user.homeDirectory;

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    home.stateVersion = "22.05";

    fonts.fontconfig.enable = true;

    nixpkgs.config.allowUnfree = true;
    #TODO: Add preview zsh function qlmanage -p update-nix-vsc-ext.sh &> /dev/null  
    #TODO: Add Plex app..... (curently running out of downloads folder)
    #TODO: Look into installing this (and its prereqs) https://github.com/dado3212/spaces-renamer
    #TODO: make https://raw.githubusercontent.com/NixOS/nixpkgs/master/pkgs/misc/vscode-extensions/update_installed_exts.sh nix package (instead of a random script in nipkgs repo)
    #TODO: Look into using x86 as a fallback for packages that are not happy with m1
    #          https://github.com/nix-dot-dev/nix.dev/issues/178
    #          https://github.com/evanrelf/dotfiles/blob/main/modules/machines/ultraviolet.nix#L43-L52
    #TODO: Maybe add Pro presenter (it asking for updates would get old quick though....) - https://renewedvision.com/downloads/propresenter/mac/ProPresenter_7.8_117964824.zip
    #TODO: add ksnip a cross platform screenshot app (it currently doesnt work with darwin but I could try to modify it to make it) Looks like it has compiler-rt issue...
    #TODO: install TopNotch from nix (it will definitly be a bin download as it isnt open source) and uninstall the non nix install
    #TODO: Make chrome work from nix (instead of current manual install) and set up home-manager settings with it
    #TODO: Make nix package for Magnet (prob find a new window manager as Magnet is not FOSS and is from App Store) - https://github.com/rxhanson/Rectangle this might work good (isnt a nix package yet so I would have to make it)  / look into  https://cbrgm.net/post/2021-05-5-setup-macos/ ("i3" in macos)
    #TODO: Figure out ssh config (~/.ssh/config) (mainly for git ssh keys) 
    #TODO: Add https://github.com/samuelmeuli/glance (likely first bin download)
    #TODO: Manage ~/.nuget/NuGet/NuGet.Config
}
