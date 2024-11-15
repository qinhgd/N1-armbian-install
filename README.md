[English](./README.md) | 简体中文

一个在Debian（或衍生版）上安装[mosdns](https://github.com/IrineSistiana/mosdns)或者singbox的shell脚本。

# singbox安装脚本：
## N1安装singbox
```
bash -c "$(curl -kfsSl https://raw.githubusercontent.com/qinhgd/mosdns-debian-install/refs/heads/v5/singbox_install.sh)"
```
### 常用命令：

#查看状态
```
systemctl status singbox
```
#启动
```
systemctl start singbox
```
#重启
```
systemctl restart singbox
```
# 重要！先决条件：需要事先为DNS服务器做好IP分流。

有关更多详细信息，请参阅[此仓库](https://github.com/allanchen2019/ospf-over-wireguard)。

### 独立安装 (amd64 & arm64):
```
bash <(curl -Ls https://raw.githubusercontent.com/allanchen2019/mosdns-debian-install/v5/AutoSetup.sh)
```

### 可选：每天7:00自动更新各种列表，`crontab -e` 后添加：

```
0 7 * * * bash /opt/mosdns/update-geo.sh  >> /var/log/cron.log 2>&1
```
### 保存退出。

### 更新资源文件:
```
bash <(curl -Ls https://raw.githubusercontent.com/allanchen2019/mosdns-debian-install/v5/update-geo.sh)
```

### 只更新可执行二进制:
```
bash <(curl -Ls https://raw.githubusercontent.com/allanchen2019/mosdns-debian-install/v5/update-bin.sh)
```
### 卸载:
```
bash <(curl -Ls https://raw.githubusercontent.com/allanchen2019/mosdns-debian-install/v5/uninstall.sh)
```

### 如不能正常安装，请先重置DNS:
```
rm -rf /etc/resolv.conf
cat << EOF >/etc/resolv.conf
nameserver 1.1.1.1
nameserver 8.8.8.8
EOF
systemctl enable systemd-resolved.service
systemctl restart systemd-resolved.service
cd ~
```
