#!/bin/bash
clear
set -euo pipefail

echo "~~~~~~~~~~"
echo "安装 mosdns"
echo "~~~~~~~~~~"
echo "下载依赖……"
apt update
apt install wget git unzip -y

target_dir="/etc/mosdns"

# 判断目标目录是否存在，如果存在则不做任何处理
if [! -d "$target_dir" ]; then
    mkdir -p "$target_dir"
fi

echo "克隆库……"
git clone https://github.com/qinhgd/mosdns-debian-install.git "$target_dir"
chmod 777 -R "$target_dir"
echo "执行安装……"
bash "$target_dir/install-mosdns.sh"

# 修改路径检查部分，确保与目标安装目录一致
if systemctl status mosdns.service | grep -q "running" && grep -q "/etc/mosdns" <(systemctl status mosdns.service); then
    echo "~~~~~~~~~~~~~~~~~~~~~~"
    echo "安装完成，mosdns 已运行！"
    echo "~~~~~~~~~~~~~~~~~~~~~~"
else
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo "Emm………好像哪里不太对，mosdns 没运行………"
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
fi

# 正确删除 AutoSetup.sh 文件
rm -rf AutoSetup.sh
