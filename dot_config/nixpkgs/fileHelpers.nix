{ lib, ... }:
# These functions are based on this example https://github.com/evanjs/nixos_cfg/blob/4bb5b0b84a221b25cf50853c12b9f66f0cad3ea4/config/new-modules/default.nix
# they are used to (recursivly) import all the nix files in a specified directory.
let
  # Recursively constructs an attrset of a given folder, recursing on directories, value of attrs is the filetype
  getDir = dir: with lib; mapAttrs
    (file: type:
      if type == "directory" then 
        getDir "${dir}/${file}" 
      else
        type
    )
    (builtins.readDir dir);

  # Collects all files of a directory as a list of strings of paths
  files = dir: with lib; collect isString (mapAttrsRecursive (path: type: concatStringsSep "/" path) (getDir dir));

in 
{
    # Filters out directories that don't end with .nix or are this file, also makes the strings absolute
  validNixFiles = dir: with lib; map
    (file: dir + "/${file}")
    (filter
      (file: 
        hasSuffix ".nix" file 
        && file != "default.nix" 
        && !lib.hasSuffix "-hm.nix" 
          file)
      (files dir));
}
