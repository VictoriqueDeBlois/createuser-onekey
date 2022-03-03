#!/bin/sh

groups="users"

echo '添加用户到组'

name=$1
if [ ! "$name" ];then echo '没有参数'; exit; fi

for group in $groups
do
  sudo usermod -a -G "$group" "$name";
done

echo '完成'
