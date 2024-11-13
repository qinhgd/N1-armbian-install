#!/bin/bash
#set -u
clear
echo "~~~~~~~~~~~~~~~~"
echo "卸载 mosdns………………"
echo "~~~~~~~~~~~~~~~~"
systemctl stop mosdns.service
systemctl disable mosdns.service > /dev/null 2>&1
rm /etc/systemd/system/mosdns.service
systemctl daemon-reload
systemctl reset-failed
rm -rf /etc/mosdns
echo "重置 DNS………………"
rm -rf /etc/resolv.conf
cat << EOF >/etc/resolv.conf
nameserver 1.1.1.1
nameserver 8.8.8.8
EOF

systemctl enable systemd-resolved.service > /dev/null 2>&1
systemctl restart systemd-resolved.service
cd ~
echo "~~~~~~~~"
echo "卸载完成!"
echo "~~~~~~~~"
