#!/bin/bash

# ============逆向分析环境搭建==================

##### Ghidra&Ghidra开发及插件环境 #####

# JAVA11环境安装
sudo apt install openjdk-11-jdk -y

# 安装Ghidra
wget https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_10.1.4_build/ghidra_10.1.4_PUBLIC_20220519.zip
unzip -o ghidra_10.1.4_PUBLIC_20220519.zip -d ~/tools/
mv ghidra_10.1.4_PUBLIC ghidra
rm ghidra_10.1.4_PUBLIC_20220519.zip

# Ghidra插件下载
mkdir ~/tools/ghidra_plugins
cd ~/tools/ghidra_plugins
wget https://github.com/ubfx/BinDiffHelper/releases/download/v0.4.1/ghidra_10.1.4_BinDiffHelper.zip\
git clone https://github.com/tacnetsol/ghidra_scripts.git


#### Ghidra插件开发环境 #####

# grandle 7.5.1
https://downloads.gradle-dn.com/distributions/gradle-7.5.1-bin.zip
unzip gradle-7.5.1-bin.zip -d ~/tools/

mv ~/tools/gradle-7.5.1 ~/tools/gradle
echo "export PATH=$PATH:~/tools/gradle/bin" >> ~/.bashrc
echo "export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64" >> ~/.bashrc
source ~/.bashrc

# jep 4.0.3
conda create -n ghidra_dev_env python=3.8
conda activate ghidra_dev_env
$HOME/miniconda3/envs/ghidra_dev_env/bin/pip3 install jep
cd ~/tools/ghidra_plugins/Ghidrathon/
gradle -PGHIDRA_INSTALL_DIR=/home/smile/tools/ghidra -PPYTHON_BIN=/home/smile/miniconda3/envs/ghidra_dev_env/bin/python3.8
echo -e "\033[32m[INFO]需要手动安装编译好的Ghidrathon并且禁用默认的jpython\033[0m"