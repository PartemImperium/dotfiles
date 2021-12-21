self: super: {
    skaarhoj-updater = with super; stdenv.mkDerivation rec {
        pname = "skaarhoj-updater";
        version = "1.0.10";

        src = fetchurl { # Create package for syphon lib (from source). And the make this package build from source (and the framework lib)
            url = "https://github.com/SKAARHOJ/skaarhoj-updater-releases/releases/download/v${version}/SKAARHOJUpdater.dmg";
            sha256 = "Xs2Z+ORVEImCfYNcyoNnFMnWCrJt/m6XvxEi91B0Ths=";
        };

        sourceRoot = ".";

        buildInputs = [ undmg ];

        phases = ["unpackPhase" "installPhase"];
        
        installPhase = ''
            mkdir -p $out/Applications
            
            mv SKAARHOJUpdater.app $out/Applications
        '';

        meta = with lib; {
            description = "Tool for creating a bootable Unraid USB.";
            #license = licenses.mit;#TODO: Check license
            homepage = "https://github.com/SKAARHOJ/skaarhoj-updater-releases/";
            platforms = platforms.darwin;
        };
    };
}