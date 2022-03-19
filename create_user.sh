#!/bin/bash

SOURCE="$0"
while [ -h "$SOURCE"  ]; do # resolve $SOURCE until the file is no longer a symlink
    DIR="$( cd -P "$( dirname "$SOURCE"  )" && pwd  )"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

name=$1
uid=$2

if [ ! "$name" ];then echo '没有参数'; exit; fi
echo "开始创建用户${name}"

cd DIR || sh "$DIR"/add_user.sh "$name" "$uid" || exit
cd DIR || sh "$DIR"/add_group.sh "$name" || exit
cd DIR || sh "$DIR"/add_conda_init.sh "$name" || exit
cd DIR || sh "$DIR"/create_nfs_link.sh "$name" || exit
cd DIR || sh "$DIR"/set_condarc.sh "$name" || exit
cd DIR || sh "$DIR"/set_pubkey.sh "$name" || exit
cd DIR || sh "$DIR"/create_instruction.sh "$name" || exit
echo '创建用户结束'
