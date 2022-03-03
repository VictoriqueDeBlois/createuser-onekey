#!/bin/sh

script_path="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

find_param() {
  tmp=$(grep "$1" "$script_path/config" | sed -e "s/$1\s*=\s*//g")
  export "$1"="$tmp"
}

conda_path=
home_path=

find_param conda_path
find_param home_path

echo '添加conda初始化到bashrc'

name=$1

if [ ! "$name" ];then echo '没有参数'; exit; fi

conda_init="\n\n# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup=\"\$('$conda_path/bin/conda' 'shell.bash' 'hook' 2> /dev/null)\"
if [ \$? -eq 0 ]; then
    eval \"\$__conda_setup\"
else
    if [ -f \"$conda_path/etc/profile.d/conda.sh\" ]; then
        . \"$conda_path/etc/profile.d/conda.sh\"
    else
        export PATH=\"$conda_path/bin:\$PATH\"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<\n"


echo "$conda_init" | sudo tee -a "$home_path/$name/.bashrc" > /dev/null 2>&1
echo '完成'
