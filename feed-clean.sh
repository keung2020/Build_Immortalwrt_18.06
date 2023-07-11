#!/bin/bash

# Description: OpenWrt DIY script run after Update feeds

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
./scripts/feeds update -a
