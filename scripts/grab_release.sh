#!/bin/bash

if [[ $1 == "--help" || -z $1 || -z $2 || -z $3 ]]; then
    echo "Usage: $0 OWNER REPO FILE_EXT"
    exit 1
fi

owner=$1
repo=$2
file_ext=$3

url="https://api.github.com/repos/${owner}/${repo}/releases/latest"
response=$(curl -s "${url}")
tag=$(echo "${response}" | jq -r '.tag_name')
links=$(echo "${response}" | jq -r '.assets[].browser_download_url')

file_link=""
for link in $links; do
    if [[ $link == *"$file_ext" ]]; then
        file_link="$link"
    fi
done

if [[ -z $file_link ]]; then
    echo "No .$file_ext file found"
else
    folder="${owner}.${repo}"
    mkdir -p "$folder"
    cd "$folder"
    file_name="$(basename "$file_link")"
    tag_file="${owner}.${repo}.${file_name%.*}"
    if [[ -f $tag_file ]]; then
        if [[ $(cat "$tag_file") == "$tag" ]]; then
            echo "Already downloaded latest version $tag of $owner/$repo"
            exit 0
        fi
    fi
    wget "$file_link"
    echo "Downloaded $file_name to $folder"
    echo "$tag" > "$tag_file"
    echo "Created $tag_file"
fi