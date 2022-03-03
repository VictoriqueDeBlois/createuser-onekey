#!/bin/sh

name=$1
if [ ! "$name" ];then echo '没有参数'; exit; fi

ip4=$(ifconfig -a|grep -C 2 enp5s0|grep inet|grep -v inet6|awk '{print $2}')

printf "\n"
echo "=========================================================="
echo "使用说明"
echo "=========================================================="
echo "用户名：$name
内网访问：$ip4"
echo "=========================================================="
printf "\n"
