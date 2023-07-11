#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)

#Delete duplicate file
rm -rf feeds/luci/applications/luci-app-aliddns
rm -rf feeds/luci/applications/luci-app-autoreboot
rm -rf feeds/luci/applications/luci-app-baidupcs-web
rm -rf feeds/luci/applications/luci-app-beardropper
rm -rf feeds/luci/applications/luci-app-dockerman
rm -rf feeds/luci/applications/luci-app-fileassistant
rm -rf feeds/luci/applications/luci-app-filebrowser
rm -rf feeds/luci/applications/luci-app-gost
rm -rf feeds/luci/applications/luci-app-guest-wifi
rm -rf feeds/luci/applications/luci-app-iptvhelper
rm -rf feeds/luci/applications/luci-app-netdata
rm -rf feeds/luci/applications/luci-app-onliner
rm -rf feeds/luci/applications/luci-app-openclash
rm -rf feeds/luci/applications/luci-app-openvpn-server
rm -rf feeds/luci/applications/luci-app-passwall
rm -rf feeds/luci/applications/luci-app-pppoe-relay
rm -rf feeds/luci/applications/luci-app-pppoe-server
rm -rf feeds/luci/applications/luci-app-ramfree
rm -rf feeds/luci/applications/luci-app-serverchan
rm -rf feeds/luci/applications/luci-app-smartdns
rm -rf feeds/luci/applications/luci-app-sms-tool
rm -rf feeds/luci/applications/luci-app-socat
rm -rf feeds/luci/applications/luci-app-softethervpn
rm -rf feeds/luci/applications/luci-app-ssr-mudb-server
rm -rf feeds/luci/applications/luci-app-ssr-plus
rm -rf feeds/luci/applications/luci-app-syncthing
rm -rf feeds/luci/applications/luci-app-sysuh3c
rm -rf feeds/luci/applications/luci-app-timecontrol
rm -rf feeds/luci/applications/luci-app-udp2raw
rm -rf feeds/luci/applications/luci-app-unblockneteasemusic
rm -rf feeds/luci/applications/luci-app-usb3disable
rm -rf feeds/luci/applications/luci-app-verysync
rm -rf feeds/luci/applications/luci-app-vssr
rm -rf feeds/luci/applications/luci-app-watchcat
rm -rf feeds/luci/applications/luci-app-wrtbwmon
rm -rf feeds/luci/applications/luci-app-xlnetacc
rm -rf feeds/luci/applications/luci-app-xunlei
rm -rf feeds/luci/applications/luci-theme-argon

# 修改openwrt登陆地址,把下面的192.168.1.1修改成你想要的就可以了
sed -i 's/192.168.1.1/192.168.168.1/g' package/base-files/files/bin/config_generate

# Fix supplicant name error
sed -i 's/DEPENDS:=+wpa_supplicant/DEPENDS:=+wpa-supplicant/g' feeds/packages/net/ieee8021xclient/Makefile

# Modify default theme
sed -i "3a\uci set luci.main.mediaurlbase=/luci-static/material" package/emortal/default-settings/files/99-default-settings
# sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify Laug
sed -i 's/auto/zh_cn/g' package/emortal/default-settings/files/99-default-settings

# Modify Adyby Update Script
sed -i 's/https:\/\/adbyby\.coding\.net\/p\/xwhyc-rules\/d\/xwhyc-rules\/git\/raw\/master\//https:\/\/raw.githubusercontent.com\/keung2020\/xwhyc-rules\/master\//g' feeds/luci/applications/luci-app-adbyby-plus/root/usr/share/adbyby/adupdate.sh
sed -i 's/https:\/\/adbyby\.coding\.net\/p\/xwhyc-rules\/d\/xwhyc-rules\/git\/raw\/master\//https:\/\/raw.githubusercontent.com\/keung2020\/xwhyc-rules\/master\//g' feeds/luci/applications/luci-app-adbyby-plus/root/usr/share/adbyby/adbybyupdate.sh
sed -i 's/https:\/\/adbyby\.coding\.net\/p\/xwhyc-rules\/d\/xwhyc-rules\/git\/raw\/master\//https:\/\/raw.githubusercontent.com\/keung2020\/xwhyc-rules\/master\//g' feeds/luci/applications/luci-app-adbyby-plus/root/usr/share/adbyby/admem.sh

# 修改主机名字，把ImmortalWrt修改你喜欢的就行（不能纯数字或者使用中文）
sed -i 's/ImmortalWrt/BrianRT_$(TZ=UTC-8 date "+%Y%m%d")/g' package/base-files/files/bin/config_generate

# 增加个性名字
# sed -i "24a\sed -i \'/DISTRIB_RELEASE/d\' /etc/openwrt_release" package/emortal/default-settings/files/99-default-settings
# sed -i "25a\echo \"DISTRIB_RELEASE=\'SNAPSHOT\'\" >> /etc/openwrt_release" package/emortal/default-settings/files/99-default-settings
# sed -i "24a\sed -i '/DISTRIB_REVISION/d' /etc/openwrt_release" package/emortal/default-settings/files/99-default-settings
# sed -i "25a\echo \"DISTRIB_REVISION=\'18.06 by Openwrt\'\" >> /etc/openwrt_release" package/emortal/default-settings/files/99-default-settings
sed -i "24a\sed -i '/DISTRIB_DESCRIPTION/d' /etc/openwrt_release" package/emortal/default-settings/files/99-default-settings
sed -i "25a\echo \"DISTRIB_DESCRIPTION=\'BrianLuo Compiled in $(TZ=UTC-8 date "+%Y.%m.%d") @ ImmortalWrt 18.06 \'\" >> /etc/openwrt_release" package/emortal/default-settings/files/99-default-settings

# 设置密码为空
sed -i '/CYXluq4wUazHjmCDBCqXF/d' package/emortal/default-settings/files/99-default-settings                                                            
