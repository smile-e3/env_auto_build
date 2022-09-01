#!/bin/bash

source $HOME/env_auto_build/base_lib/base.sh

function vm_tools {
    # 安装vm-tools工具
    echo -e "$GREEN[INFO]正在安装vm-tools-desktop$END"
    sudo apt install open-vm-tools-desktop -y # 重启效果更好
}

function base_tools {
    echo -e "$GREEN[INFO]正在安装git$END"
    sudo apt install git -y

    echo -e "$GREEN[INFO]正在安装wget$END"
    sudo apt install wget -y
}

function v2_proxy {
    echo -e "$GREEN[INFO]正在克隆auto-v2ray项目$END"
    git clone https://github.91chi.fun/https://github.com/smile-e3/auto-v2ray.git -o $tool_path/auto-v2ray
    chmod +x $tool_path/auto-v2ray/v2ray-core/v2ray_core_install.sh
    echo -e "$GREEN[INFO]正在安装v2ray-core$END"
    sudo $tool_path/auto-v2ray/v2ray-core/./v2ray_core_install.sh # 需要使用root权限安装

    echo -e "GREEN[INFO]正在安装v2raya$END"
    chmod +x $tool_path/auto-v2ray/v2raya/v2raya_install.sh
    bash $tool_path/auto-v2ray/v2raya/v2raya_install.sh # 安装完成要配置好全局代理

    echo -e "$YELLOW[注意]配置v2raya的代理地址$END"
}


