#!/usr/bin/env zsh
# TODO: Unset any role environment vars that are already set...
for f in ~/.config/roles/chosen/*; do
    eval "export $f:t:r=true";
done
