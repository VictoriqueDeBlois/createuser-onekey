#!/bin/sh

home_path=/data
pubkey_path=/data/nfs/pubkey

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
