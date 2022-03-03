#!/bin/sh

home_path=/data;

get_condarc() {
    condarc=$(curl --request GET -sL \
                  --url 'https://mirror.tuna.tsinghua.edu.cn/help/anaconda/' \
                  | grep '<code>.+?</code><' -zoE | sed 's/<code>//g' | sed 's/<\/code><//g');
    if [ ! "$condarc" ]; then
      condarc="show_channel_urls: true";
    fi
    condarc=$condarc"\nauto_activate_base: false\n";
}

echo '设置condarc';

name=$1
if [ ! "$name" ];then echo '没有参数'; exit; fi

get_condarc
echo "$condarc" | sudo tee "$home_path/$name/.condarc" > /dev/null 2>&1
sudo chown "$name":"$name" "$home_path/$name/.condarc"

echo '完成'
