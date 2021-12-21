self: super: {
    unraid-usb-creator = with super; stdenv.mkDerivation rec {
        pname = "unraid-usb-creator";
        version = "1.8";

        src = fetchurl { # Create package for syphon lib (from source). And the make this package build from source (and the framework lib)
            url = "https://craftassets.unraid.net/uploads/downloads/Unraid.USB.Creator.macOS-${version}.dmg";
            sha256 = "o8S+UoFNirEs1aoeTQXoULrmNktnWi5wOlF6ijyd5c0=";
        };

        sourceRoot = ".";

        buildInputs = [ undmg ];

        phases = ["unpackPhase" "installPhase"];
        
        installPhase = ''
            mkdir -p $out/Applications
            
            mv "Unraid USB Creator.app" $out/Applications
        '';

        meta = with lib; {
            description = "Tool for creating a bootable Unraid USB.";
            #license = licenses.mit;#TODO: Check license
            homepage = "https://unraid.net/";
            platforms = platforms.darwin;
        };
    };
}