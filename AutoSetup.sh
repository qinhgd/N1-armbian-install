#!/bin/bash

# 设置更具描述性的变量名
repo_url="https://github.com/qinhgd/mosdns-debian-install.git"
install_dir="/etc/mosdns"

# 清理终端输出
clear

# 严格模式，防止错误扩展并确保未声明变量报错
set -euo pipefail

echo "~~~~~~~~~~"
echo "安装 mosdns"
echo "~~~~~~~~~~"
echo "下载依赖……"
apt update
apt install wget git unzip -y

echo "克隆库……"
# 检查目录是否存在，不存在则克隆
if [! -d "$install_dir" ]; then
    git clone "$repo_url" "$install_dir"
    chmod 777 -R "$install_dir"
else
    echo "安装目录已存在，跳过克隆步骤。"
fi

echo "执行安装……"
bash "$install_dir/install-mosdns.sh"

# 修改路径检查部分，确保与目标安装目录一致
if systemctl status mosdns.service | grep -q "running" && grep -q "$install_dir" <(systemctl status mosdns.service); then
    echo "~~~~~~~~~~~~~~~~~~~~~~"
    echo "安装完成，mosdns 已运行！"
    echo "~~~~~~~~~~~~~~~~~~~~~~"
else
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo "Emm………好像哪里不太对，mosdns 没运行………"
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
fi

# 正确删除 AutoSetup.sh 文件
if [ -f "AutoSetup.sh" ]; then
    rm -rf AutoSetup.sh
    echo "已删除 AutoSetup.sh 文件。"
else
    echo "AutoSetup.sh 文件不存在，无需删除。"
fi
