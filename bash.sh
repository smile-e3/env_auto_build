#!/bin/bash

# 安装vm-tools工具
# sudo apt install open-vm-tools-desktop -y # 重启效果更好

# git工具
sudo apt install git -y

# wget
sudo apt install wget -y

# 安装v2ray-core和v2raya
git clone https://github.91chi.fun/https://github.com/smile-e3/auto-v2ray.git
cd auto-v2ray
chmod +x v2ray-core/v2ray_core_install.sh
sudo ./v2ray-core/v2ray_core_install.sh # 需要使用root权限安装

chmod +x v2raya/v2raya_install.sh
./v2raya/v2raya_install.sh # 安装完成要配置好全局代理