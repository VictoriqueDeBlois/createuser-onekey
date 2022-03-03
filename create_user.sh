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

"$DIR"/add_user.sh "$name" "$uid"
"$DIR"/add_group.sh "$name"
"$DIR"/add_conda_init.sh "$name"
"$DIR"/create_nfs_link.sh "$name"
"$DIR"/set_condarc.sh "$name"
"$DIR"/set_pubkey.sh "$name"
"$DIR"/create_instruction.sh "$name"
echo '创建用户结束'
