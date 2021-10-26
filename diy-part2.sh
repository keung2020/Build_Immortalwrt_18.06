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
#

# 修改openwrt登陆地址,把下面的192.168.2.2修改成你想要的就可以了
sed -i 's/192.168.1.1/192.168.168.1/g' package/base-files/files/bin/config_generate

# 修改主机名字，把OpenWrt-123修改你喜欢的就行（不能纯数字或者使用中文）
sed -i 's/hostname='ImmortalWrt'/hostname='BrianWrt'/g' package/base-files/files/bin/config_generate

# Modify the version number
sed -i "s/OpenWrt /BrianLuo build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/emortal/default-settings/files/zzz-default-settings

# Fix supplicant name error
sed -i 's/DEPENDS:=+wpa_supplicant/DEPENDS:=+wpa-supplicant/g' feeds/packages/net/ieee8021xclient/Makefile

# Modify default theme
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
