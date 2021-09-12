#!/bin/bash

# Make the config mode directory if it doesnt exist
mkdir -p ~/.config/roles/chosen;

# Initialize array
options=();

# Initialize index (I dont think there is a for loop with iterator)
i=0;
for f in ~/.config/roles/options/*; do
    # Add the index to show in dialog
    options+=($i);
    
    # The file contents contains the Verbage to show for the role in dialog (add it)
    contents="$(<$f)";
    options+=("$contents");

    # Do string replacement for options to choosen (getting the path to check if the file has been choosen)
    chosenFile="${f//options/chosen}";
    
    # Check if the role is already activated and start it that way in dialog
    if [[ -f "$chosenFile" ]]; then
        options+=("on");
    else
        options+=("off");
    fi

    # Incriment the index
    i=$(( i + 1 ));
done

function dialog_menu()
{
    width=50;
    height=15;
    list_height=10;

    arr="$(dialog --clear --backtitle "Menu Test" --title "This is a test for Menu entry" --checklist "Menu" $height $width $list_height "${!1}" --output-fd 1)";

    for i in $arr; do
       (( j = (i * 3) + 1 ));
       echo ${array[$j]};
    done
echo
}

dialog_menu array[@];