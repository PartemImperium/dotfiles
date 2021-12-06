    { config, lib, pkgs, ... }:

    let
    unstable = import <nixpkgs-unstable> { config = pkgs.config; };
    nixgl = import <nixgl> { pkgs = unstable; };
    vars = import ./variables.nix;
    fileHelpers = import ./fileHelpers.nix { lib = lib; };

    in
    {
    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;

    imports = 
          lib.lists.optionals vars.isDarwin (fileHelpers.validNixFiles ./darwin)
       ++ lib.lists.optionals vars.isLinux (fileHelpers.validNixFiles ./linux)
       ++ lib.lists.optionals vars.isWsl (fileHelpers.validNixFiles ./wsl)
       ++ (fileHelpers.validNixFiles ./pkgsConfig)
       # The work modules are not tracked in git. They are added manually on my work computer for anything that is work specific (and I dont want in source control). 
       # They are also added after everything else so that they can override settings set in other configs.
       ++ lib.lists.optionals vars.isWork (fileHelpers.validNixFiles ./work); 

    # Home Manager needs a bit of information about you and the
    # paths it should manage.
    home.username = vars.username;
    home.homeDirectory = vars.homeDirectory;

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    home.stateVersion = "21.05";
    
    fonts.fontconfig.enable = true;

    nixpkgs.config.allowUnfree = true;
}
