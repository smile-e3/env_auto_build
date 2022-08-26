#!/bin/bash

# ubuntu18.04安装python2的pip
sudo apt -y python-pip

# 安装miniconda
# miniconda链接:https://docs.conda.io/en/latest/miniconda.html
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
chmod +x Miniconda3-latest-Linux-x86_64.sh
./Miniconda3-latest-Linux-x86_64.sh # 默认配置即可
echo "conda deactivate" >> ~/.bashrc
rm ./Miniconda3-latest-Linux-x86_64.sh
source ~/.bashrc

# ============格式转换环境搭建=================

# 创建python3.8的vehicles的环境
conda create -n vehicles python=3.8
conda activate vehicles
pip install bincopy # 虚拟环境安装bincopy

# 安装srecord
sudo apt install srecord -y


# ============逆向分析环境搭建==================

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