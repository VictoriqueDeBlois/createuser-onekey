#!/bin/sh

home_path=/data

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
