# mosdns-cn-debian-install
A shell script installs [mosdns-cn](https://github.com/IrineSistiana/mosdns-cn) on Debian(or derivatives) Linux.

### Prerequisite
A proper ip split tunneling for native and remote dns servers is required. 

See https://github.com/allanchen2019/ospf-over-wireguard for more detail.

### Install standalone (amd64 & arm64):
```
wget https://raw.githubusercontent.com/allanchen2019/mosdns-cn-debian-install/main/setup.sh && chmod 777 ./setup.sh && sudo ./setup.sh
```


### Uninstall:
```
bash /opt/mosdns-cn/uninstall.sh
```
