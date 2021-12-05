    { config, lib, pkgs, ... }:

    let
    unstable = import <nixpkgs-unstable> { config = pkgs.config; };
    nixgl = import <nixgl> { pkgs = unstable; };
    vars = import ./variables.nix;
    fileHelpers = import ./fileHelpers.nix { lib = lib; };

    #Package Lists.
    #Each list can be added to the home.packages array wth a ++. 

    videoUtils = with pkgs; [
        makemkv      # bluray ripping tool # I still need to get config all set up for this one
        ffmpeg       # video encoder
        handbrake    # video encoder
        youtube-dl   # cli tool to download videos from youtube and other online sites
    ];

    audioUtils = with pkgs; [
        flac # cli tool to encode audio files as flac
    ];

    audioApps = with pkgs; [
#        picard # audio tagging program
    ];

    apps = with pkgs; [
        # vlc    # audio and video player 
    ];

    imageApps = with pkgs; [
        gimp     # free image editing utility much like photoshop
        inkscape # free vector graphics editor
    ];

    in

    {
    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;

    imports = [ 
        # Put common imports here.
        
     ] ++ lib.lists.optionals vars.isDarwin ([] ++ fileHelpers.validNixFiles ./darwin)
       ++ lib.lists.optionals vars.isLinux ([] ++ fileHelpers.validNixFiles ./linux)
       ++ lib.lists.optionals vars.isWsl ([] ++ fileHelpers.validNixFiles ./wsl)
       ++ ([] ++ fileHelpers.validNixFiles ./pkgsConfig)
       # The work modules are not tracked in git. They are added manually on my work computer for anything that is work specific (and I dont want in source control). 
       # They are also added after everything else so that they can override settings set in other configs.
       ++ lib.lists.optionals vars.isWork ([] ++ fileHelpers.validNixFiles ./work); 

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

    home.packages = with pkgs; [
        neofetch                                                                     # cli tool for displaying system info
        chezmoi                                                                      # dotfiles manager
        dialog                                                                       # cli menu
        curl                                                                         # cli tool to download files
        nano                                                                         # cli text editor
        micro                                                                        # cli text editor on steroids
        glow                                                                         # cli markdown renderer
        (nerdfonts.override { fonts = ["Hack"]; enableWindowsFonts = vars.isWsl; })  # Hack font with several font icon sets patched
    ] ++ lib.lists.optionals vars.shouldInstallVideo videoUtils 
      ++ lib.lists.optionals vars.shouldInstallAudio audioUtils 
      ++ lib.lists.optionals (vars.shouldInstallAudio && vars.isGui) audioApps 
      ++ lib.lists.optionals vars.shouldInstallApps apps
      ++ lib.lists.optionals (vars.shouldInstallImage && vars.isGui) imageApps;
}
