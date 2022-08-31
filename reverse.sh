#!/bin/bash

# 全局变量
tool_path=$HOME/tools

# 判断文件夹是否存在
if [ ! -d "$tool_path" ];then
	mkdir $tool_path
fi

# ============逆向分析环境搭建==================

##### Ghidra&Ghidra开发及插件环境 #####

# JAVA11环境安装
sudo apt install openjdk-11-jdk -y

# 安装Ghidra
echo -e "\033[32m[INFO]正在下载Ghidra\033[0m"
wget https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_10.1.4_build/ghidra_10.1.4_PUBLIC_20220519.zip
unzip -o ghidra_10.1.4_PUBLIC_20220519.zip -d $tool_path
mv $tool_path/ghidra_10.1.4_PUBLIC $tool_path/ghidra
rm ghidra_10.1.4_PUBLIC_20220519.zip

# Ghidra插件下载
mkdir $tool_path/ghidra_plugins
git clone https://github.com/tacnetsol/ghidra_scripts.git $tool_path/ghidra_plugins


#### Ghidra插件开发环境 #####

# grandle 7.5.1
# https://downloads.gradle-dn.com/distributions/gradle-7.5.1-bin.zip
# unzip gradle-7.5.1-bin.zip -d ~/tools/

# mv ~/tools/gradle-7.5.1 ~/tools/gradle
# echo "export PATH=$PATH:~/tools/gradle/bin" >> ~/.bashrc
# echo "export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64" >> ~/.bashrc
# source ~/.bashrc

# # jep 4.0.3
# conda create -n ghidra_dev_env python=3.8
# conda activate ghidra_dev_env
# $HOME/miniconda3/envs/ghidra_dev_env/bin/pip3 install jep

# 如果使用python3.7
# sudo apt install python3.7-dev

# cd ~/tools/ghidra_plugins/Ghidrathon/
# gradle -PGHIDRA_INSTALL_DIR=/home/smile/tools/ghidra -PPYTHON_BIN=/home/smile/miniconda3/envs/ghidra_dev_env/bin/python3.8
# echo -e "\033[32m[INFO]需要手动安装编译好的Ghidrathon并且禁用默认的jpython\033[0m"

# radare2环境
echo -e "\033[32m[INFO]正在克隆radare2\033[0m"
git clone https://github.com/radareorg/radare2 $tool_path/radare2
echo -e "\033[32m[INFO]正在安装radare2\033[0m"
$tool_path/radare2/sys/install.sh

echo -e "\033[32m[INFO]正在下载Cutter\033[0m"
wget https://github.com/rizinorg/cutter/releases/download/v2.1.0/Cutter-v2.1.0-Linux-x86_64.AppImage
echo -e "\033[32m[INFO]正在安装Cutter\033[0m"
sudo mv Cutter-v2.1.0-Linux-x86_64.AppImage /bin/Cutter
sudo chmod +x /bin/Cutter
