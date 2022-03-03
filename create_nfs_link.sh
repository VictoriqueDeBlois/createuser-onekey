#!/bin/sh

home_path=/data
share_path=/data/nfs

link=$(basename $share_path)

echo '添加nfs链接'
name=$1
if [ ! "$name" ];then echo '没有参数'; exit; fi

user_share_path="$share_path/$name"
if [ ! -d "$user_share_path" ]; then
	mkdir "$user_share_path";
	sudo chown "$name":"$name" "$user_share_path";
	sudo chmod 775 "$user_share_path";
else
	echo 'nas上文件夹已经存在';
fi

link_path="$home_path/$link"
if [ ! -L "$link_path" ]; then
	sudo ln -s "$user_share_path" "$link_path";
	sudo chown "$name":"$name" "$link_path";
else
	echo '链接已经存在';
fi
echo '完成'
