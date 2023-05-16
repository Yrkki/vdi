#!/bin/bash

echo $'\033[1;33m'Running script clone-repos
echo ------------------------------------------------------$'\033[1;33m'
echo

echo $'\033[0;33m'Clone Repos starting...$'\033[0m'
echo
pwd=$(pwd)
pwd
ls -aF --color=always
echo

echo $'\033[1;30m'Configuring parameters...$'\033[0m'
dirRepos=~/source/repos
echo dir repos: "$dirRepos"
dirR="$dirRepos"/r
echo dir r: "$dirR"
dirCvGenerator="$dirRepos"/cv-generator
echo dir cv-generator: "$dirCvGenerator"
echo $'\033[1;30m'Configuring parameters complete.$'\033[0m'
echo

process() {
  repo="$1"
  dir="$2"

  echo $'\033[1;30m' Using the $'\033[0;35m'"$repo"$'\033[1;30m' repo and the $'\033[0;35m'"$dir"$'\033[1;30m' folder...$'\033[0m'

  mkdir -p "$dir"
  cd "$dir"

  repoName=$(echo "$repo" | sed -nr 's/.*\/([^\/]*)\.git/\1/p')
  repoPath="$2"/"$repoName"

  git config --global --add safe.directory "$repoPath"
  if [[ -d "$repoName" ]]; then
    cd "$repoName"
    # git init
    git pull
  else
    git clone $repo
  fi
}

echo $'\033[1;30m'Reading repos...$'\033[0m'
readarray -t arrRepos < <(curl 'https://api.github.com/users/Yrkki/repos' | grep -e 'clone_url*' | cut -d \" -f 4)
echo $'\033[1;30m'Reading $'\033[0;35m'"${#arrRepos[@]}"$'\033[1;30m' repos complete.$'\033[0m'
echo

echo $'\033[1;30m'Processing...$'\033[0m'
for i in "${!arrRepos[@]}"; do
  arrRepo=${arrRepos[$i]}

  case $arrRepo in
  *\/dsbook*.git) process "$arrRepo" "$dirR" ;;
  *\/labs*.git) process "$arrRepo" "$dirR" ;;

  *\/cv-generator*.git) process "$arrRepo" "$dirCvGenerator" ;;
  *\/life-*.git) process "$arrRepo" "$dirCvGenerator" ;;
  *\/project-*.git) process "$arrRepo" "$dirCvGenerator" ;;
  *\/organization*.git) process "$arrRepo" "$dirCvGenerator" ;;

  *) process "$arrRepo" "$dirRepos" ;;
  esac
done
echo $'\033[1;30m'Processing $'\033[0;35m'"${#arrRepos[@]}"$'\033[1;30m' repos complete.$'\033[0m'
echo

echo $'\033[1;30m'Back to the original folder:$'\033[0m'
cd "$pwd"
pwd
echo

echo
echo $'\033[1;32m'Clone Repos finished...$'\033[0m'

echo
# read  -n 1 -p "x" input
# return
