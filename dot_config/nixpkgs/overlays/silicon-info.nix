self: super: {
    silicon-info = with super; stdenv.mkDerivation rec {
        pname = "silicon-info";
        version = "1.0.3";

        src = fetchzip {
            url = "https://github.com/billycastelli/Silicon-Info/releases/download/${version}/Silicon.Info.app.zip";
            sha256 = "Vrv/KVWofvJtIHDeYsJKAF5E1MdC/opHNX/aGr+I+Kk=";
            stripRoot = false;
        };

        #TODO: Look into building from source using xcbuild
        #src = fetchFromGitHub {
        #    owner = "billycastelli";
        #    repo = "Silicon-Info";
        #    rev = "${version}";
        #    sha256 = "1gfs92y7rkkv75llwj2bvapqn36jmx19fx14pz4y6lg28prcmnml";
        #};

        installPhase = ''
            mkdir -p $out/Applications
            mv "Silicon Info.app" $out/Applications
        '';

        meta = with lib; {
            description = "Silicon Info is a tiny menu bar application allows the user to quickly view the architecture of the currently running application.";
            license = licenses.mit;
            homepage = "https://github.com/billycastelli/Silicon-Info";
            platforms = platforms.darwin;
        };
    };
}