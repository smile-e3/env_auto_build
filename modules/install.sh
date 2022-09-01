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