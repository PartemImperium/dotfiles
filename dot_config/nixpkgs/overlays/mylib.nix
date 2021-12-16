self: super: {
    myLib = rec {
        file = import ../fileHelpers.nix { lib = super.lib; };
    };
}