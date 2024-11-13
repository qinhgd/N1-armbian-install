#!/bin/bash
set -euo pipefail

echo "~~~~~~~~~~~~~~"
echo "更新资源文件………"
echo "~~~~~~~~~~~~~~"
cd /etc/mosdns/bin || exit

wget --show-progress -t 5 -T 10 -cqO accelerated-domains.china.conf https://raw.githubusercontent.com/felixonmars/dnsmasq-china-list/master/accelerated-domains.china.conf
wget --show-progress -t 5 -T 10 -cqO apple.china.conf https://github.com/felixonmars/dnsmasq-china-list/raw/master/apple.china.conf
sed -r 's/.{8}//' accelerated-domains.china.conf > accelerated-domains.china.conf2
sed -r 's/.{16}$//' accelerated-domains.china.conf2 > accelerated-domains.china.conf.raw.txt
sed -r 's/.{8}//' apple.china.conf > apple.china.conf2
sed -r 's/.{16}$//' apple.china.conf2 > apple.china.conf.raw.txt
./mosdns service restart > /dev/null 2>&1

if systemctl status mosdns.service |grep -q "running"; then
        echo "~~~~~~~~~~~~~~~~"
        echo "资源文件更新完成！"
        echo "~~~~~~~~~~~~~~~~"
    else
        echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        echo "Emm………好像哪里不太对，mosdns 挂了………"
        echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
fi
