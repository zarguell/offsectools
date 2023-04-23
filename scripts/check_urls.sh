#!/bin/bash
# quicker simplified release checker to reference the download urls available

owner=$1
repo=$2

url="https://api.github.com/repos/${owner}/${repo}/releases/latest"
response=$(curl -s "${url}")
links=$(echo "${response}" | jq -r '.assets[].browser_download_url')

echo "${links}"
