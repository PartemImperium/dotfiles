#!/usr/bin/env zsh

for f in ~/.config/roles/chosen/*; do
    eval "export $f:t:r=true";
done