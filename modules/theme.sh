#!/bin/bash

# 全局变量
tool_path=$HOME/tools

# 判断文件夹是否存在
if [ ! -d "$tool_path" ];then
	mkdir $tool_path
fi


# == 安装轻量级桌面 ==
sudo apt install xfce4 -y

# == 安装主题以及ICONS ==
tar -xf theme_icons/Dracula.tar.xz
sudo mv Dracula/ /usr/share/themes
tar -xf theme_icons/BigSur.tar.xz
sudo mv BigSur/ /usr/share/icons
sudo mv BigSur-dark/ /usr/share/icons

# == 安装hack ttf字体 ==
sudo apt-get -y install fonts-hack-ttf

# == 上述主题需要先退出，切换为XFCE后在Application->Settings->Appearance->Style/Icons/Font进行配置 ==
echo -e "\033[32m[INFO]请退出切换XFCE桌面后手动配置\033[0m"


# == 安装zsh ==
sudo apt install zsh -y

# == 安装oh-my-zsh ==
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -o $tool_path/install.sh
sh $tool_path/install.sh
rm $tool_path/install.sh

# == zsh配置 ==
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone http://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions


git clone http://github.com/possatti/pokemonsay
cd pokemonsay
./install.sh
sudo apt install cowsay -y

sudo apt install fortune -y