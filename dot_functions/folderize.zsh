
function folderize() {
    names=( $@ );
    for fullFile in "${names[@]}"; do
        if [[ -f "$fullFile" ]]; then
            #Get needed parts of file.
            fileName="$fullFile:t:r";
            fileDir="$fullFile:h"

            #Put parts together to make new directory
            newDir="$fileDir/$fileName"

            #Make new directory and move file into it.
            mkdir $newDir;
            mv $fullFile $newDir;
        fi
    done
}
