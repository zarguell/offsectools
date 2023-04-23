#!/bin/bash

if [[ $1 == "--help" || -z $1 ]]; then
    echo "Usage: $0 path/to/tool_list.txt"
    exit 1
fi

tool_list=$1

while read -r owner repo file_ext; do
    echo "Getting latest release for $owner/$repo with .$file_ext file extension"
    bash ./scripts/grab_release.sh $owner $repo $file_ext
done < "$tool_list"
