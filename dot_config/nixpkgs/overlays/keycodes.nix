self: super: {
    keycodes = with super; stdenv.mkDerivation rec {
        pname = "keycodes";
        version = "2.2.1";

        src = fetchurl { 
            url = "https://manytricks.com/download/keycodes";#TODO: Figure out how to get a exact version... Their version downloads are for macos versions not app versions... This link will break when a new version is released... In that case I will have to update the sha
            name = "keycodes221.dmg";
            sha256 = "olkBADBFq5B5r52R0llmAgCevnl1BRmt12Zom05cDVQ=";
        };

        sourceRoot = ".";

        buildInputs = [ undmg ];

        phases = ["unpackPhase" "installPhase"];
        
        installPhase = ''
            mkdir -p $out/Applications
            
            mv "Key Codes.app" $out/Applications
        '';

        meta = with lib; {
            description = "Key Codes is a little utility that displays the key code, unicode value, and modifier keys state for any key combination you press. If you're a developer, this might be useful to you.";
            #license = licenses.mit;#TODO: Check license
            homepage = "https://manytricks.com/keycodes/";
            platforms = platforms.darwin;
        };
    };
}