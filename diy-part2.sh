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

# Modify default IP
sed -i 's/192.168.1.1/192.168.168.1/g' package/base-files/files/bin/config_generate

# Modify hostname
sed -i 's/OpenWrt/BrianRT/g' package/base-files/files/bin/config_generate

# Modify the version number
sed -i "s/Immortalwrt /BrianLuo build $(TZ=UTC-8 date "+%Y.%m.%d") @ Immortalwrt /g" package/lean/default-settings/files/zzz-default-settings

# Modify default theme
# sed -i 's/luci-theme-bootstrap/luci-theme-material/g' feeds/luci/collections/luci/Makefile

# Add kernel build user
[ -z $(grep "CONFIG_KERNEL_BUILD_USER=" .config) ] &&
    echo 'CONFIG_KERNEL_BUILD_USER="BrianLuo"' >>.config ||
    sed -i 's@\(CONFIG_KERNEL_BUILD_USER=\).*@\1$"BrianLuo"@' .config

# Add kernel build domain
[ -z $(grep "CONFIG_KERNEL_BUILD_DOMAIN=" .config) ] &&
    echo 'CONFIG_KERNEL_BUILD_DOMAIN="Github Actions"' >>.config ||
    sed -i 's@\(CONFIG_KERNEL_BUILD_DOMAIN=\).*@\1$"GitHub Actions"@' .config
