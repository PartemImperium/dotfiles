
# I dont think this should be needed...... TODO: Look into why I need it when home-manager is managing the .zshrc
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  source "/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh";
fi

if [ -e '$HOME/.nix-profile/etc/profile.d/nix.sh' ]; then
  source "$HOME/.nix-profile/etc/profile.d/nix.sh";
fi
export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH;
