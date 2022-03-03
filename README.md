使用说明

1. 配置config
2. 自定义create_instruction.sh
3. 自定义create_user.sh中需要运行的脚本

功能说明

add_user.sh
1. 创建用户。接受两个参数，用户名和可选的指定UID。
2. 创建完毕会询问备注，将设置passwd中的别名。
3. 需要设置home的父目录，在config中指定，参数home_path。

add_group.sh
1. 将用户加入指定的用户组。接受一个参数，用户名。
2. 用户组在config中指定，参数groups。

add_conda_init.sh
1. 用户的bashrc后添加conda的初始化脚本。接受一个参数, 用户名。
2. conda的路径需要在config中指定，参数conda_path。

set_condarc.sh
1. 设置用户的condarc，切换清华源，不自动激活base环境。接受一个参数，用户名。
2. 其中清华源设置从清华源官方网站获取，如果没有联网则只是不自动激活base环境。

set_pubkey.sh
1. 设置用户的公钥，公钥从pubkey_path中获取xxx.pub文件。接受一个参数，用户名。
2. 其中，pubkey_path在config中指定，xxx.pub中的xxx要与用户名一致。

create_nfs_link.sh
1. 在共享文件夹创建和用户名一致的文件夹，并且创建一个链接到用户的home下。接受一个参数，用户名。
2. 一般是用于挂载的共享文件夹，共享文件夹在config中指定，参数share_path。

create_instruction.sh.sh
1. 生成创建用户后的使用说明给新用户，可以通过网卡名获取ipv4的地址给ip4变量。接受一个参数，用户名。
2. 其中网卡名在config中指定，参数nic。

create_user.sh
1. 一键创建用户，允许脚本软链接正常运行。接受两个参数，用户名和可选的指定UID。
