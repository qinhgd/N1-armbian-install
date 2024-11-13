#!/bin/bash
set -euo pipefail

echo "~~~~~~~~~~~~~~"
echo "更新程序文件………"
echo "~~~~~~~~~~~~~~"

architecture=$(dpkg --print-architecture)
cd /etc/mosdns/bin || exit
rm -rf mosdns*
wget --show-progress -t 5 -T 10 -cqO mosdns.zip https://github.com/IrineSistiana/mosdns/releases/latest/download/mosdns-linux-"$architecture".zip
unzip -o *.zip > /dev/null 2>&1
./mosdns service restart > /dev/null 2>&1
if systemctl status mosdns.service |grep -q "running"; then
        echo "~~~~~~~~~~~~~~~~"
        echo "程序文件更新完成！"
        echo "~~~~~~~~~~~~~~~~"
    else
        echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        echo "Emm………好像哪里不太对，mosdns 挂了………"
        echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
fi
