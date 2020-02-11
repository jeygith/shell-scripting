#!/bin/bash
# script to add changes and sync dotfiles

#echo "cd to $HOME"

#cd $HOME/dotfiles
#pwd
#echo "git add ."
#git add .
#git commit -m "latest sync $(date)"
#echo "git commit -m 'latest sync $(date)'"
#git push origin master
#echo "git push origin master"

message="latest sync from $USER@$(hostname -s) on $(date)"
echo "$message"
GIT=`which git`
REPO_DIR=~/dotfiles
cd ${REPO_DIR}
echo ${pwd}
add=$(${GIT} add . 2>&1)

echo "$add"

commit=$(${GIT} -c commit.gpgsign=false  commit -m "$message" 2>&1)

echo "$commit"

status=$(${GIT} status 2>&1)

echo "$status"

gitPush=$(${GIT} push -vvv origin master 2>&1)
echo "$gitPush"

