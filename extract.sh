#!/bin/bash

# ============固件提取环境搭建==================

##### binwalk #####
# 依赖项：python3.6+/git

tools_home=$HOME/tools
cd $tools_home
git clone https://github.com/ReFirmLabs/binwalk.git
cd binwalk

sudo apt-get install libqt4-opengl python3-opengl python3-pyqt4 python3-pyqt4.qtopengl python3-numpy python3-scipy python3-pip -y
sudo pip3 install nose coverage
sudo pip3 install pycryptodome
sudo pip3 install capstone
sudo apt-get install mtd-utils gzip bzip2 tar arj lhasa p7zip p7zip-full cabextract cramfsswap squashfs-tools sleuthkit default-jdk lzop srecord -y
mkdir depds
cd depds

# Install sasquatch to extract non-standard SquashFS images
sudo apt-get install zlib1g-dev liblzma-dev liblzo2-dev -y
git clone https://github.com/devttys0/sasquatch
cd sasquatch && ./build.sh && cd ..

# Install jefferson to extract JFFS2 file systems
sudo pip3 install cstruct
git clone https://github.com/sviehb/jefferson
cd jefferson && sudo python3 setup.py install && cd ..

# Install ubi_reader to extract UBIFS file systems
sudo apt-get install liblzo2-dev python-lzo -y
sudo apt install -f
git clone https://github.com/jrspruitt/ubi_reader
cd ubi_reader && sudo python3 setup.py install && cd ..

# Install yaffshiv to extract YAFFS file systems
git clone https://github.com/devttys0/yaffshiv
cd yaffshiv && sudo python3 setup.py install && cd ..

# Install unstuff (closed source) to extract StuffIt archive files
wget -O - http://downloads.tuxfamily.org/sdtraces/stuffit520.611linux-i386.tar.gz | tar -zxv
sudo cp bin/unstuff /usr/local/bin/

# Install cramfsprogs
wget http://launchpadlibrarian.net/118041897/cramfsprogs_1.1-6build4_amd64.deb
sudo dpkg -i cramfsprogs_1.1-6build4_amd64.deb

# 删除依赖项
sudo rm -rf $tools_home/binwalk/depds

cd $tools_home/binwalk && sudo python3 setup.py install