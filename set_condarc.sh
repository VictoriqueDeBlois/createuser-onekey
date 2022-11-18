#!/bin/sh

script_path="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

find_param() {
  tmp=$(grep "$1" "$script_path/config" | sed -e "s/$1\s*=\s*//g")
  export "$1"="$tmp"
}

home_path=

find_param home_path

echo '设置condarc';

name=$1
if [ ! "$name" ];then echo '没有参数'; exit; fi

cp ./condarc "$home_path/$name/.condarc"
sudo chown "$name":"$name" "$home_path/$name/.condarc"

echo '完成'
