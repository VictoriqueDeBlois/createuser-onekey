#!/bin/sh

script_path="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

find_param() {
  tmp=$(grep "$1" "$script_path/config" | sed -e "s/$1\s*=\s*//g")
  export "$1"="$tmp"
}

home_path=
pubkey_path=

find_param home_path
find_param pubkey_path

echo '添加公钥'
name=$1

if [ ! "$name" ];then echo '没有参数'; exit; fi

if [ -d "$home_path/$name" ]; then
	sudo mkdir -p "$home_path/$name/.ssh";
	sudo chown "$name":"$name" -R "$home_path/$name/.ssh";
else
	echo '用户文件夹不存在';
	exit;
fi

if [ -f "$pubkey_path/${name}.pub" ]; then
	sudo cp "$pubkey_path/${name}.pub" "$home_path/$name/.ssh/authorized_keys";
	sudo chmod 600 "$home_path/$name/.ssh/authorized_keys";
else
	echo '公钥文件不存在';
fi

echo '完成'
