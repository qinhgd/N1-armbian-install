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
### 运行这个命令看下报错日志，根据日志解决问题：
```
/usr/local/bin/singbox run -D /root/singbox/
```
### Tproxy怎么开启
redirect性能和Tproxy差不多，不需要udp的话可以redirect用，想开启的话就。

先redirect安装，再选择6：重新配置Tproxy

开Tproxy先关闭Tun的自动路由，重新上传配置后再开Tproxy

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

安装tailscale 
curl -fsSL https://tailscale.com/install.sh | sh

tailscale up

echo 'net.ipv4.ip_forward = 1' | sudo tee -a /etc/sysctl.d/99-tailscale.conf
echo 'net.ipv6.conf.all.forwarding = 1' | sudo tee -a /etc/sysctl.d/99-tailscale.conf
sudo sysctl -p /etc/sysctl.d/99-tailscale.conf

sudo tailscale up --advertise-routes=192.168.31.0/24,192.168.1.0/24

sudo tailscale up --advertise-exit-node

tailscale up --advertise-exit-node --advertise-routes=192.168.1.0/24,192.168.31.0/24


安装AdGuardHome
curl -sSL https://raw.githubusercontent.com/AdguardTeam/AdGuardHome/master/scripts/install.sh | sh
设置开机启动
iptables -t nat -A PREROUTING -p tcp --dport 53 -j REDIRECT --to-ports 5353
iptables -t nat -A PREROUTING -p udp --dport 53 -j REDIRECT --to-ports 5353
ip6tables -t nat -A PREROUTING -p tcp --dport 53 -j REDIRECT --to-ports 5353
ip6tables -t nat -A PREROUTING -p udp --dport 53 -j REDIRECT --to-ports 5353
安装nftables
sudo apt update
sudo apt install nftables


停用systemd-resolved……"
systemctl stop systemd-resolved.service
systemctl disable systemd-resolved.service
systemctl daemon-reload
systemctl stop systemd-resolved.service
systemctl start systemd-resolved.service
安装nftables
sudo apt update
sudo apt install nftables
安装shellcrash
export url='https://fastly.jsdelivr.net/gh/juewuy/ShellCrash@master' && wget -q --no-check-certificate -O /tmp/install.sh $url/install.sh  && bash /tmp/install.sh && source /etc/profile &> /dev/null
https://sub.vip.sd/JPa6vvFgygVtNP2sGJ2r/download/NL?target=V2Ray
https://ss.cft.my/api/v1/client/subscribe?token=0fc3bf2d9f05074b1e5bd5ace8af359e
https://nachoneko.cn/api/v1/client/subscribe?token=7678c2fc5d5860bdb8d621a9a0801295
https://sub.vip.sd/JPa6vvFgygVtNP2sGJ2r/download/NL?target=Clash

安装1panel
curl -sSL https://resource.fit2cloud.com/1panel/package/quick_start.sh -o quick_start.sh && bash quick_start.sh
卸载
1pctl uninstall

安装luvky
curl -o /tmp/install.sh   https://6.66666.host:66/files/golucky.sh  && sh /tmp/install.sh https://6.66666.host:66/files 2.13.4
安装alist
默认安装在 /opt/alist 中。 自定义安装路径，将安装路径作为第二个参数添加，必须是绝对路径（如果路径以 alist 结尾，则直接安装到给定路径，否则会安装在给定路径 alist 目录下），如 安装到 /root：

# Install
curl -fsSL "https://alist.nn.ci/v3.sh" | bash -s install /root
# update
curl -fsSL "https://alist.nn.ci/v3.sh" | bash -s update /root
# Uninstall
curl -fsSL "https://alist.nn.ci/v3.sh" | bash -s uninstall /root
启动: systemctl start alist
关闭: systemctl stop alist
状态: systemctl status alist
重启: systemctl restart alist
#获取密码
需要进入脚本安装AList的目录文件夹內执行如下命令

#低于v3.25.0版本

./alist admin
#高于v3.25.0版本
3.25.0以上版本将密码改成加密方式存储的hash值，无法直接反算出密码，如果忘记了密码只能通过重新 随机生成 或者 手动设置


# 随机生成一个密码
./alist admin random
# 手动设置一个密码,`NEW_PASSWORD`是指你需要设置的密码
./alist admin set NEW_PASSWORD

安装MOSDN
bash <(curl -Ls https://raw.githubusercontent.com/allanchen2019/mosdns-debian-install/v5/AutoSetup.sh)

安装openwrt
1、创建 macvlan 网络
docker network create -d macvlan --subnet=192.168.31.0/24 --gateway=192.168.31.1 -o parent=eth0 macnet
2、拉取镜像并创建容器
docker run -d --name=openwrt --network=macnet --privileged=true --restart=always --ulimit nofile=16384:65536 -v /lib/modules/$(uname -r):/lib/modules/$(uname -r) summary/openwrt-aarch64:latest
3、更改固件默认 IP 地址
docker exec openwrt sed -e 's/192.168.1.1/192.168.31.2/' -i /etc/config/network
容器创建成功后稍等几分钟执行命令，将 IP 更改为与主路由同一网段的 IP 地址，更改完成后重启容器生效
docker restart openwrt

vi /etc/config/network
