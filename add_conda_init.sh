#!/bin/sh

conda_path=/data/miniconda3
home_path=/data

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
