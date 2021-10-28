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

# Fix supplicant name error
sed -i 's/DEPENDS:=+wpa_supplicant/DEPENDS:=+wpa-supplicant/g' feeds/packages/net/ieee8021xclient/Makefile

# Modify default theme
# sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify Laug
sed -i 's/auto/zh_cn/g' package/emortal/default-settings/files/zzz-default-settings

# 修改主机名字，把OpenWrt-123修改你喜欢的就行（不能纯数字或者使用中文）
sed -i 's/ImmortalWrt/BrianRT_$(TZ=UTC-8 date "+%Y%m%d")/g' package/base-files/files/bin/config_generate

# Modify the version number
# sed -i "/distfeeds.conf/a\sed -i 's/DISTRIB_DESCRIPTION='%D %V %C'/DISTRIB_DESCRIPTION='%D %V build$(TZ=UTC-8 date "+%Y%m%d")'/g' /etc/openwrt_release" package/emortal/default-settings/files/zzz-default-settings
sed -i "/distfeeds.conf/a\echo "DISTRIB_DESCRIPTION='ImmortalWrt 18.06 Build$(TZ=UTC-8 date "+%Y%m%d") '" >> /etc/openwrt_release" package/emortal/default-settings/files/zzz-default-settings
sed -i "/distfeeds.conf/a\sed -i '/DISTRIB_DESCRIPTION/d' /etc/openwrt_release" package/emortal/default-settings/files/zzz-default-settings
# sed -i "/distfeeds.conf/a\echo "DISTRIB_REVISION='R$(TZ=UTC-8 date "+%Y.%m.%d")'" >> /etc/openwrt_release" package/emortal/default-settings/files/zzz-default-settings
# sed -i "/distfeeds.conf/a\sed -i '/DISTRIB_REVISION/d' /etc/openwrt_release" package/emortal/default-settings/files/zzz-default-settings
