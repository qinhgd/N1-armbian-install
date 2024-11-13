#!/bin/bash
clear
set -euo pipefail
echo "~~~~~~~~~~"
echo "安装 mosdns"
echo "~~~~~~~~~~"
echo "下载依赖……"
apt update
apt install wget git unzip pip -y
echo "克隆库……"
git clone https://github.com/allanchen2019/mosdns-debian-install.git /etc/mosdns
chmod 777 -R /etc/mosdns
echo "执行安装……"
bash /etc/mosdns/install-mosdns.sh

if systemctl status mosdns.service | grep -q "running"; then
    echo "~~~~~~~~~~~~~~~~~~~~~~"
    echo "安装完成，mosdns 已运行！"
    echo "~~~~~~~~~~~~~~~~~~~~~~"
else
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo "Emm………好像哪里不太对，mosdns 没运行………"
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
fi
rm -rf./AutoSetup.sh
