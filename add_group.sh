#!/bin/sh

script_path="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

find_param() {
  tmp=$(grep "$1" "$script_path/config" | sed -e "s/$1\s*=\s*//g")
  export "$1"="$tmp"
}

groups=

find_param groups

echo '添加用户到组'

name=$1
if [ ! "$name" ];then echo '没有参数'; exit; fi

for group in $groups
do
  sudo usermod -a -G "$group" "$name";
done

echo '完成'
