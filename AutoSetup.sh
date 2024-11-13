#!/bin/bash
clear
set -euo pipefail
echo "~~~~~~~~~~"
echo "安装 mosdns"
echo "~~~~~~~~~~"
echo "下载依赖……"
apt update
apt install wget git unzip pip -y

target_dir="/etc/mosdns"

# 判断目标目录是否存在，如果存在则删除
if [ -d "$target_dir" ]; then
    rm -rf "$target_dir"
fi

echo "克隆库……"
git clone https://github.com/allanchen2019/mosdns-debian-install.git "$target_dir"
chmod 777 -R "$target_dir"
echo "执行安装……"
bash "$target_dir/install-mosdns.sh"

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
