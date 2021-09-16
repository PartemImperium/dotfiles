#!/usr/bin/env zsh

# Make the config mode directory if it doesnt exist
mkdir -p ~/.config/roles/chosen;

# Initialize dialog options
local -a dialogOptions;

# Initialize file name to index to be used to manage the chosen roles.
local -a files;

# Initialize index (I dont think there is a for loop with iterator)
i=1;
for f in ~/.config/roles/options/*; do
    # Add the file name and index for later
    files[$i]=$f;

    # Add the index to show in dialog
    dialogOptions+=$i;
    
    # The file contents contains the Verbage to show for the role in dialog (add it)
    contents="$(<$f)";
    dialogOptions+=("$contents");

    # Do string replacement for options to choosen (getting the path to check if the file has been choosen)
    chosenFile="${f//options/chosen}";
    
    # Check if the role is already activated and start it that way in dialog
    currentStatus="off";
    if [[ -f "$chosenFile" ]]; then
        currentStatus="on";
    fi

    dialogOptions+=("$currentStatus");

    # Incriment the index
    i=$(( i + 1 ));
done

width=50;
height=15;
list_height=10;

arr="$(dialog --clear --backtitle "Menu Test" --title "This is a test for Menu entry" --checklist "Menu" $height $width $list_height ${dialogOptions} --output-fd 1)";

for i in $arr; do
    (( j = (i * 3) + 1 ));
    echo ${arr[$j]};
    echo ${files[$i]};
done
