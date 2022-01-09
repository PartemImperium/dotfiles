self: super: {
    stats = with super; stdenv.mkDerivation rec {
        pname = "stats";
        version = "2.6.26";

        src = fetchurl { #TODO: Create package from source instead of using pre built binary.
            url = "https://github.com/exelban/stats/releases/download/v${version}/Stats.dmg";
            sha256 = "9ZJUWiXuaoqkeSyBpHmQIyFUFf+mO0ehExecsNpSCyU=";
        };

        sourceRoot = ".";

        buildInputs = [ undmg ];

        phases = ["unpackPhase" "installPhase"];

        installPhase = ''
            mkdir -p $out/Applications

            mv "Stats.app" $out/Applications
        '';

        meta = with lib; {
            description = "macOS system monitor in your menu bar";
            license = licenses.mit;
            homepage = "https://github.com/exelban/stats";
            platforms = platforms.darwin;
        };
    };
}