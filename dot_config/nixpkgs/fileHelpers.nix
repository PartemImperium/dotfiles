{ lib, ... }:
# These functions are based on this example https://github.com/evanjs/nixos_cfg/blob/4bb5b0b84a221b25cf50853c12b9f66f0cad3ea4/config/new-modules/default.nix
# they are used to (recursivly) import all the nix files in a specified directory.
rec {
    # Recursively constructs an attrset of a given folder, recursing on directories, value of attrs is the filetype
    getDir = dir: 
      lib.mapAttrs
      (file: type:
        if type == "directory" then 
          getDir "${dir}/${file}" 
        else
          type
      )
      (builtins.readDir dir);

    # Collects all files of a directory as a list of strings of paths
    files = dir: lib.collect lib.isString (lib.mapAttrsRecursive (path: type: lib.concatStringsSep "/" path) (getDir dir));

    # Collect all files of a directory as a list of strings of paths and filter them with the passed filter.
    validFiles = dir: filter: map (file: dir + "/${file}") (lib.filter (filter) (files dir));

    # Filters out directories that don't end with .nix or are this file, also makes the strings absolute
    validNixFiles = dir: 
    validFiles 
    dir 
    (f: 
        (lib.hasSuffix ".nix" f) 
     && (f != "default.nix") 
     && (!lib.hasSuffix "-hm.nix" f)
    );

    # Filters out directories that don't end with .zsh, also makes the strings absolute
    validZshFiles = dir: validFiles dir (f: (lib.hasSuffix ".zsh" f));

    #Combines the passed files into a single string
    combineFiles = files:
      if builtins.isList files then
        builtins.concatStringsSep "" (map (f: lib.fileContents f) files)
      else
        "";
}
