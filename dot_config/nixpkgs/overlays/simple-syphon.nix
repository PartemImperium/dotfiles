self: super: {
    simple-syphon = with super; stdenv.mkDerivation rec {
        pname = "simple-syphon";
        version = "5";

        src = fetchzip { # Create package for syphon lib (from source). And the make this package build from source (and the framework lib)
            url = "https://github.com/Syphon/Simple/releases/download/${version}/Syphon.Simple.Apps.zip";
            sha256 = "9Hso/z/7U2w3vE5yclwTkAuLJMvnEln4QDL2CLveOJw=";
            stripRoot = false;
        };

        installPhase = ''
            mkdir -p $out/Applications

            mv "Syphon Simple Apps/Simple Client.app" $out/Applications
            mv "Syphon Simple Apps/Simple Server.app" $out/Applications
        '';

        meta = with lib; {
            description = "Simple Client and Simple Server demo and testbed applications for Syphon.";
            #license = licenses.mit;#TODO: Check license
            homepage = "https://github.com/Syphon/Simple";
            platforms = platforms.darwin;
        };
    };
}