{ config, lib, pkgs, ... }:
let
  pkgs_x86_64 = import <nixpkgs> { localSystem = "x86_64-darwin";  };
in
{
    #config = mkIf (stdenv.hostPlatform.isDarwin && stdenv.hostPlatform.isAarch64) { #TODO: Find out why this didnt work with the if
        pkgsConfig = {
            wireshark.package = pkgs_x86_64.wireshark;
            gimp.package = pkgs_x86_64.gimp;
            inkscape.package = pkgs_x86_64.inkscape;
        };
    #};
}
