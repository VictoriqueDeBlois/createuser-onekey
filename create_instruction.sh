#!/bin/sh

script_path="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

find_param() {
  tmp=$(grep "$1" "$script_path/config" | sed -e "s/$1\s*=\s*//g")
  export "$1"="$tmp"
}

nic=
find_param nic

name=$1
if [ ! "$name" ];then echo '没有参数'; exit; fi

ip4=$(ifconfig -a|grep -C 2 "$nic"|grep inet|grep -v inet6|awk '{print $2}')

printf "\n"
echo "=========================================================="
echo "使用说明"
echo "=========================================================="
echo "用户名：$name
内网访问：$ip4"
echo "=========================================================="
printf "\n"
