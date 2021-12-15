self: super: {
    inkscape = super.inkscape.overrideAttrs (oldAttrs: rec {
        #buildInputs = oldAttrs.buildInputs ++ [super.gspell];

        nativeBuildInputs = oldAttrs.nativeBuildInputs ++ [ super.makeWrapper ];

        postInstall = super.lib.optionalString super.stdenv.isDarwin oldAttrs.postInstall + ''
        mkdir -p $out/Applications/Inkscape.app/Contents/MacOS
        makeWrapper $out/bin/inkscape $out/Applications/Inkscape.app/Contents/MacOS/inkscape

        mkdir -p $out/Applications/Inkscape.app/Contents/Resources/
        cp -r ../packaging/macos/resources/. $out/Applications/Inkscape.app/Contents/Resources/    

        cp ../packaging/macos/inkscape.plist $out/Applications/Inkscape.app/Contents/Info.plist
        '';
    });
}
