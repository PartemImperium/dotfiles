#!/bin/bash
#Note I perfer zsh but it is not installed on all systems and I want nix to manage the install of zsh.... And this is my nix install script...

#Parse arguments for branch.
#https://brianchildress.co/named-parameters-in-bash/
branch=${environment:-master}

while [ $# -gt 0 ]; do

   if [[ $1 == *"--"* ]]; then
        param="${1/--/}"
        declare $param="$2"
        # echo $1 $2 // Optional to see the parameter:value result
   fi

  shift
done


#The type of install to do.
    #0 : undefined (will error out)
    #1 : multi user (daemon)
    #2 : single user (no-daemon)
    #3 : multi user darwin encrypted nix store (daemon)
nixInstallType=0;

shopt -s nocasematch;

unameA="$(uname -a)";
unameS="$(uname -s)";


if [[ $unameS  == "linux"* ]]; then
    if [[ $unameA == *"microsoft"* || -f "/.dockerenv" ]]; then
        nixInstallType=2;
    else
        nixInstallType=1;
    fi
elif [[ $unameS  == "darwin"* ]]; then
    nixInstallType=3;
else
    nixInstallType=0;
fi

#We dont want nix to modify and shell profiles to auto load it. The config it wants to add is already in the .zshrc
NIX_INSTALLER_NO_MODIFY_PROFILE=true

case $nixInstallType in 
    0)
        echo "Unkown OS exiting";
        exit -1;
        ;;
    1)
        curl -L https://nixos.org/nix/install | sh -s -- --daemon;
        ;;
    2)
        curl -L https://nixos.org/nix/install | sh -s -- --no-daemon;
        ;;
    3)
        curl -L https://nixos.org/nix/install | sh -s -- --darwin-use-unencrypted-nix-store-volume --daemon;
        ;;
esac

#We told nix to not add this to the profile so run it by hand before chezmoi is installed/configured
. ~/.nix-profile/etc/profile.d/nix.sh;

NIX_HOME_DIR="$HOME/.config/nixpkgs";
NIX_HOME_FILE="$NIX_HOME_DIR/home.nix";
NIX_HOME_BOOTSTRAP="{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;

  # Fix I/O error when writing XML
  xdg.mime.enable = false;

  # Basic packages to setup the rest
  home.packages = [
    pkgs.chezmoi
    pkgs.git
    pkgs.openssh
    pkgs.zsh
  ];
}";

mkdir -p $NIX_HOME_DIR;
echo "$NIX_HOME_BOOTSTRAP" > $NIX_HOME_FILE;

nix-channel --add https://github.com/nix-community/home-manager/archive/release-21.05.tar.gz home-manager;
nix-channel --update;

nix-shell '<home-manager>' -A install;

export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH;

#chezmoi is installed now but still not configured so we need to run this
. "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh";

chezmoi init --apply PartemImperium --branch $branch;

home-manager switch;
