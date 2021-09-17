#!/usr/bin/env zsh

# Make the config mode directory if it doesnt exist
mkdir -p ~/.config/roles/chosen;

# Initialize dialog options
local -a dialogOptions;

# Initialize file name to index to be used to manage the chosen roles.
local -a files;

#Add Height to dialog options
dialogOptions+=(15);

#Add Width to dialog options
dialogOptions+=(50);

#Add List Height to dialog options
dialogOptions+=(10);

# Initialize index (I dont think there is a for loop with iterator)
i=1;
for f in ~/.config/roles/options/*; do
    # Add the index to show in dialog
    dialogOptions+=$i;

    # The file contents contains the Verbage to show for the role in dialog (add it)
    contents="$(<$f)";
    dialogOptions+=("$contents");

    # Do string replacement for options to choosen (getting the path to check if the file has been choosen)
    chosenFile="${f//options/chosen}";

    # Add the file name and index for later
    files[$i]=$chosenFile;

    # Check if the role is already activated and start it that way in dialog
    currentStatus="off";
    if [[ -f "$chosenFile" ]]; then
        currentStatus="on";
    fi

    dialogOptions+=("$currentStatus");

    # Incriment the index
    i=$(( i + 1 ));
done

out="$(dialog --clear --backtitle "Menu Test" --title "This is a test for Menu entry" --checklist "Menu" ${dialogOptions} --stdout)";
clear;

rm ~/.config/roles/chosen/*;

#            v   Split string by " " character (indicated by the v earlier) to an array.
parts=(${(@s: :)out});#TODO: Pull this into a function so it can be reused.
for i in ${parts[@]}; do
    touch $files[$i];
done
