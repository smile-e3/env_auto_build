#!/bin/bash

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