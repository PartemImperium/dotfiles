#!/bin/bash -i

#Parse arguments for branch and distro (with default values).
#https://brianchildress.co/named-parameters-in-bash/
branch=${environment:-master}
distro=${distro:-ubuntu}

while [ $# -gt 0 ]; do

   if [[ $1 == *"--"* ]]; then
        param="${1/--/}"
        declare $param="$2"
        # echo $1 $2 // Optional to see the parameter:value result
   fi

  shift
done

gitUrl="https://github.com/PartemImperium/dotfiles.git#$branch";

dockerTag="dotfiles-$distro";
dockerFile="dockerfiles/$distro/Dockerfile";

docker build -t $dockerTag $gitUrl -f $dockerFile --build-arg branch=$branch;
docker run -e TERM -e COLORTERM -it --rm $dockerTag;
