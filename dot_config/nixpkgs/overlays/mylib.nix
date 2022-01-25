self: super: {#TODO: Figure out how unit tests work and add them for all these functions
    myLib = rec {
        scripting = rec {# TODO: Move this to its own file
            convertListToBashArray = list: super.lib.concatStringsSep " " (super.lib.lists.map (x: ''"${x}"'') list);
        };

        file = import ../fileHelpers.nix { lib = super.lib; };
    };
}