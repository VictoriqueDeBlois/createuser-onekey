#!/bin/sh

script_path="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

find_param() {
  tmp=$(grep "$1" "$script_path/config" | sed -e "s/$1\s*=\s*//g")
  export "$1"="$tmp"
}

home_path=

find_param home_path

echo '创建用户'

name=$1
uid=$2

if [ ! "$name" ];then echo '没有参数'; exit; fi

if id -u "$name" >/dev/null 2>&1; then
        echo "用户已经存在";
else
	if [ "$uid" ];then
		sudo useradd "$name" -u "$uid" -d "$home_path/$name" -m -s /bin/bash -U;
	else
		sudo useradd "$name" -d "$home_path/$name" -m -s /bin/bash -U;
	fi
fi

echo "备注:";
read -r alias;

if [ "$alias" ]; then
  sudo sed -i "/$name/{s/::/:$alias,,,:/g}" /etc/passwd
fi

echo '完成'
