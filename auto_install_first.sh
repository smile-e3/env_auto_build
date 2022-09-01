#!/bin/bash
source $HOME/env_auto_build/base_lib/base.sh
source $HOME/env_auto_build/modules/bash.sh

# 判断工具文件夹是否存在
if [ ! -d "$tool_path" ];then
	mkdir $tool_path
fi

# 给执行权限
chmod +x $HOME/env_auto_build/base_lib/*
chmod +x $HOEM/env_auto_build/modules/*

# updata更新
sudo apt update

# 安装vm-tools
vm_tools

# 安装基础工具
base_tools

# 安装代理工具
v2_proxy
